#
# Copyright 2016, 2017 Chris Cummins <chrisc.101@gmail.com>.
#
# This file is part of CLgen.
#
# CLgen is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# CLgen is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with CLgen.  If not, see <http://www.gnu.org/licenses/>.
#
from unittest import TestCase, skipIf
from clgen import test as tests

import os
import sqlite3
import sys

import labm8
from labm8 import fs
from labm8 import system

import clgen

# Invoke tests with UPDATE_GS_FILES set to update the gold standard
# tests. E.g.:
#
#   $ UPDATE_GS_FILES=1 python3 ./setup.py test
#
UPDATE_GS_FILES = True if 'UPDATE_GS_FILES' in os.environ else False

def preprocess_pair(basename, preprocessor=clgen.preprocess):
    gs_path = tests.data_path(os.path.join('cl', str(basename) + '.gs'),
                              exists=not UPDATE_GS_FILES)
    tin_path = tests.data_path(os.path.join('cl', str(basename) + '.cl'))

    # Run preprocess
    tin = tests.data_str(tin_path)
    tout = preprocessor(tin)

    if UPDATE_GS_FILES:
        gs = tout
        with open(gs_path, 'w') as outfile:
            outfile.write(gs)
            print("\n-> updated gold standard file '{}' ..."
                  .format(gs_path), file=sys.stderr, end=' ')
    else:
        gs = tests.data_str(gs_path)

    return (gs, tout)


class TestPreprocess(TestCase):
    def test_preprocess(self):
        self.assertEqual(*preprocess_pair('sample-1'))

    def test_preprocess_shim(self):
        # FLOAT_T is defined in shim header
        self.assertTrue(clgen.preprocess("""
__kernel void A(__global FLOAT_T* a) { int b; }""", use_shim=True))

        # Preprocess will fail without FLOAT_T defined
        with self.assertRaises(clgen.BadCodeException):
            clgen.preprocess("""
__kernel void A(__global FLOAT_T* a) { int b; }""", use_shim=False)

    def test_ugly_preprocessed(self):
        # empty kernel protoype is rejected
        with self.assertRaises(clgen.NoCodeException):
            clgen.preprocess("""\
__kernel void A() {
}\
""")
        # kernel containing some code returns the same.
        self.assertEqual("""\
__kernel void A() {
  int a;
}\
""", clgen.preprocess("""\
__kernel void A() {
  int a;
}\
"""))

    def test_preprocess_stable(self):
        code = """\
__kernel void A(__global float* a) {
  int b;
  float c;
  int d = get_global_id(0);

  a[d] *= 2.0f;
}"""
        # pre-processing is "stable" if the code doesn't change
        out = code
        for _ in range(5):
            out = clgen.preprocess(out)
            self.assertEqual(out, code)

    @skipIf(not system.is_linux(), "Pre-built binary")  # FIXME: GPUVerify support on macOS.
    def test_gpuverify(self):
        code = """\
__kernel void A(__global float* a) {
  int b = get_global_id(0);
  a[b] *= 2.0f;
}"""
        self.assertEqual(
            clgen.gpuverify(code, ["--local_size=64", "--num_groups=128"]),
            code)

    @skipIf(not system.is_linux(), "Pre-built binary")  # FIXME: GPUVerify support on macOS.
    def test_gpuverify_data_race(self):
        code = """\
__kernel void A(__global float* a) {
  a[0] +=  1.0f;
}"""
        with self.assertRaises(clgen.GPUVerifyException):
            clgen.gpuverify(code, ["--local_size=64", "--num_groups=128"])
