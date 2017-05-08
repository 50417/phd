#!/usr/bin/env python
import sqlalchemy as sql

from collections import Counter
from progressbar import ProgressBar
from signal import Signals

import db
from db import *


CLDRIVE_TABLE_NAMES = ["CLSmith w. cldrive", "GitHub"]
CLDRIVE_TABLES = [cldriveCLSmithResult, GitHubResult]


# Group outcomes into less-granular classifications, as in the CLSmith paper.
# This table maps <outcome>: <classification>
CLASSIFICATIONS = {
    '__NOT_IMPLEMENTED_YET__': 'Wrong code',
    'CL_BUILD_PROGRAM _FAILURE': 'Build failure',
    'CL_INVALID_COMMAND_QUEUE': 'Runtime crash',
    'CL_INVALID_KERNEL_NAME': 'Build failure',
    'CL_INVALID_VALUE': 'Runtime crash',
    'CL_OUT_OF_HOST_MEMORY': 'Runtime crash',
    'CL_OUT_OF_RESOURCES': 'Runtime crash',
    'cldrive Error': 'Invalid testcase',
    'cldrive.driver.PorcelainError: SIGFPE': 'Runtime crash',
    'clWaitForEvents()': 'Runtime crash',
    'INVALID_WORK_GROUP_SIZE': 'Invalid testcase',
    'Multiple OpenCL kernels': 'Invalid testcase',
    'No OpenCL kernel': 'Invalid testcase',
    'Preprocessing Failed': 'Invalid testcase',
    'Segmentation Fault': 'Build failure',
    'SIGABRT': 'Runtime crash',
    'SIGBUS': 'Runtime crash',
    'SIGILL': 'Runtime crash',
    'Signal 5': 'Runtime crash',
    'SIGTRAP': 'Runtime crash',
    'Timeout': 'Invalid testcase',
    'UnicodeError': 'Invalid testcase',
    'Unsupported Program': 'Invalid testcase',
    'z_Okay': 'Okay',
    'cldrive.driver.PorcelainError: 127': 'Runtime crash',
    'cldrive.driver.PorcelainError: 1': 'Runtime crash',
}


def lookup_status(status):
    try:
        return {
            -11: "Segmentation Fault",
            -9: "Timeout",
            0: "z_Okay",
            1024: "Preprocessing Failed",
            1025: "UnicodeError",
        }[status]
    except KeyError:
        try:
            return Signals(-status).name
        except ValueError:
            return f'Returncode {status}'


def get_cl_launcher_outcome(result):
    if result.status == 1:
        # exit status of 1 indicates that cl_launcher exited after an OpenCL API call error
        prev = None
        for line in reversed(result.stderr.split('\n')):
            if line == "Error found (callback):":
                # Interpret CLSmith error callback messages: the following line describes the error
                return prev.split()[0]
            elif line.startswith("Error"):
                # Interpret CLSmith error messages
                return {
                    "Error building program: -11": "CL_BUILD_PROGRAM _FAILURE",
                    "Error creating kernel: -46": "CL_INVALID_KERNEL_NAME",
                    "Error enqueueing kernel: -5": "CL_OUT_OF_RESOURCES",
                    "Error enqueueing kernel: -6": "CL_OUT_OF_HOST_MEMORY",
                    "Error sending finish command: -36": "CL_INVALID_COMMAND_QUEUE",
                }.get(line, line)
            prev = line
        else:  # should never happen
            print("\nI could not understand this output:")
            print(result.stderr)
            print("Return code:", result.status)
            print("stdout:")
            print(result.stdout)
            print("RESULT ID:", result.id)
            raise LookupError
    else:
        return lookup_status(result.status)


def get_cldrive_outcome(result):
    if result.status == 1:
        # exit status of 1
        line = result.stderr.split('\n')[-2]  # last line contains the Exception line
        if line.startswith('cldrive.args.OpenCLValueError'):
            return 'Unsupported Program'
        elif line.startswith('ValueError: unsupported data type'):
            return 'cldrive Error'
        elif line.startswith('TypeError: unsupported operand type'):
            return 'cldrive Error'
        elif line.startswith('TypeError: _set_args() takes'):
            return 'cldrive Error'
        elif line.startswith('ValueError: could not broadcast input array from shape'):
            return 'cldrive Error'
        else:
            # This table maps <exception line>: <outcome>
            return {
                'AssertionError': 'cldrive Error',
                'cldrive.driver.PorcelainError: SIGBUS': 'SIGBUS',
                'cldrive.driver.PorcelainError: SIGSEGV': 'Segmentation Fault',
                'cldrive.driver.Timeout: 60': 'Timeout',
                'EOFError: Ran out of input': 'cldrive Error',
                'KeyError: \'outputs\'': 'cldrive Error',
                'LookupError: source contains more than one kernel definition': 'Multiple OpenCL kernels',
                'LookupError: source contains no kernel definitions.': 'No OpenCL kernel',
                'pyopencl.cffi_cl.LogicError: clEnqueueNDRangeKernel failed: INVALID_WORK_GROUP_SIZE': 'INVALID_WORK_GROUP_SIZE',
                'pyopencl.cffi_cl.LogicError: clWaitForEvents failed: <unknown error -9999>': 'clWaitForEvents()',
                'pyopencl.cffi_cl.RuntimeError: clEnqueueNDRangeKernel failed: OUT_OF_HOST_MEMORY': 'CL_OUT_OF_HOST_MEMORY',
                'pyopencl.cffi_cl.RuntimeError: clEnqueueNDRangeKernel failed: OUT_OF_RESOURCES': 'CL_OUT_OF_RESOURCES',
                'RuntimeError': 'cldrive Error',
                'ValueError: failed to set kernel args': 'cldrive Error',
            }.get(line, line)
    else:
        return lookup_status(result.status)


def analyze_cl_launch_result(result, session):
    result.outcome = get_cl_launcher_outcome(result)
    result.classification = CLASSIFICATIONS[result.outcome]

    # determine if output differs from the majority (if there is one)
    if result.status == 0:
        outputs = [x[0] for x in session.query(CLSmithResult.stdout)\
            .filter(CLSmithResult.program == result.program,
                    CLSmithResult.params == result.params,
                    CLSmithResult.status == 0)]
        if len(outputs) > 2:
            # Use voting to pick oracle.
            majority_output, majority_count = Counter(outputs).most_common(1)[0]
            if majority_count == 1:  # no majority
                result.classification = "Wrong code"
            elif result.stdout != majority_output:
                result.classification = "Wrong code"
        elif len(outputs) == 2:
            if outputs[0] != outputs[1]:
                result.classification = "Wrong code"


def analyze_cldrive_result(result, session, require_gpuverified=False):
    result.outcome = get_cldrive_outcome(result)
    result.classification = CLASSIFICATIONS[result.outcome]

    # determine if output differs from the majority (if there is one)
    is_okay = result.status == 0
    if is_okay and require_gpuverified:
        is_okay |= result.program.gpuverified == 1

    if result.status == 0:
        outputs = [x[0] for x in session.query(table.stdout)\
            .filter(table.program == result.program,
                    table.params == result.params,
                    table.status == 0)]
        if len(outputs) > 2:
            # Use voting to pick oracle.
            majority_output, majority_count = Counter(outputs).most_common(1)[0]
            if majority_count == 1:  # no majority
                result.classification = "Wrong code"
            elif result.stdout != majority_output:
                result.classification = "Wrong code"
        elif len(outputs) == 2:
            if outputs[0] != outputs[1]:
                result.classification = "Wrong code"

    result.outcome = get_cldrive_outcome(result)
    result.classification = CLASSIFICATIONS[result.outcome]


def main():
    db.init("cc1")
    session = db.make_session()

    print("Possible classifications:", ", ".join(f"'{s}'" for s in sorted(set(CLASSIFICATIONS.values()))))

    # cl_launcher result outcomes and classifications
    print("CLSmith ...")
    for result in ProgressBar()(session.query(CLSmithResult).all()):
        analyze_cl_launch_result(result, session)
    session.commit()

    # cldrive results outcomes and classifications
    for name, table in zip(CLDRIVE_TABLE_NAMES, CLDRIVE_TABLES):
        print(f"{name} ...")
        for result in ProgressBar()(session.query(table).all()):
            analyze_cldrive_result(result, session)
        session.commit()

    # CLgen programs have special treatment because we require that they be
    # gpuverified before labeling as wrong code
    name = "CLgen"
    table = CLgenResult
    print(f"{name} ...")
    for result in ProgressBar()(session.query(table).all()):
        analyze_cldrive_result(result, session, require_gpuverified=True)
    session.commit()


if __name__ == "__main__":
    main()
