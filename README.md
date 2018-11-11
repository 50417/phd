# My PhD

This is the forked repo of Chris Cummins Phd Folder. 
This is the working copy of the Project for 6324

The work is inspired by 
1. Chris Cummins, Pavlos Petoumenos, Alastair Murray, Hugh Leather.
   "**DeepSmith: Compiler Fuzzing through Deep Learning**".
   ACACES '18.
   [[source code]](/docs/2018_07_acaces).
   [[pdf]](https://chriscummins.cc/pub/2018-acaces.pdf).

The entire project is built using [Bazel](https://bazel.build), with a
preliminary [configure](/configure) script to setup the build. 

Please create virtual environment so that the installation doesnot conflict with system wide installs.  
This project can only be built on a modern version of Ubuntu Linux . There are issues on macOS

#### Installing Ubuntu requirements

First install the required packages:

```sh
$ sudo apt-get update
$ sudo apt install -y --no-install-recommends \
   ca-certificates curl g++ git libmysqlclient-dev ocl-icd-opencl-dev \
   pkg-config python python-dev python3.6 python3.6-dev python3-distutils \
   unzip zip zlib1g-dev openjdk-11-jdk  m4 libexempi-dev rsync texlive-full \
   python3-numpy build-essential libsdl2-dev libjpeg-dev nasm tar libbz2-dev \
   libgtk2.0-dev cmake libfluidsynth-dev libgme-dev libopenal-dev timidity \
   libwildmidi-dev libboost-all-dev libsdl2-dev
```

Please note that this list of packages is for Ubuntu 18.04. On older
distributions some of the packages may not exist. For example, Ubuntu
distributions prior to 16.10 require a custom PPA to provide the `python3.6`
package.

Next, install [Bazel](https://docs.bazel.build/versions/master/install-ubuntu.html#installing-bazel-on-ubuntu):

```sh
$ curl -L -o /tmp/bazel.sh https://github.com/bazelbuild/bazel/releases/download/0.14.1/bazel-0.14.1-installer-linux-x86_64.sh
$ sudo bash /tmp/bazel.sh && rm /tmp/bazel.sh
```

macOS installation requirements are on Chris's repo. But the installation is not straightforward and have issues. 

Install the requirements which are common across platforms:
Install julia : 


```sh
$ julia
(julia)$ import Pkg
(julia)$ Pkg.add("CxxWrap")
(julia)$ exit()
```

Clone this project:(as of now clone in /var directory)

```
$ git clone https://github.com/50417/phd.git
$ cd phd
```

Configure the build and answer the yes/no questions. The default answers should
be fine:

```sh
$ sudo ./configure
```

Note that CUDA support requires CUDA to have been installed separately,
see the [TensorFlow build docs](https://www.tensorflow.org/install/) for
instructions. CUDA support has only been tested for Linux builds, not macOS or
Docker containers.

Finally, we must set up the shell environment for running bazel. The file `.env`
is created by the configure process and must be sourced for every shell we want
to use bazel with:

```sh
$ source $PWD/.env
```

Now build or test whatever bazel targets you'd like. Use `bazel query //...` to
list the available targets. E.g. to run the entire test suite, run:

```bash
$ bazel test //lib/labm8:fs_test
```

# Simulink Models

## Pre-processing Simulink Models

See Readme.md in `slearner` directory to learn how to run preprocessor.

Next, collect only those models which still run after preprocessing.

    cd slsf_randgen
    export COVEXPEXPLORE="/location/of/preprocessed/files"
    export COVEXPSUCCESS="/location/where/you/want/to/save/these/models"
    matlab &
    covexp.covcollect # Run in MATLAB prompt

After running this, the pre-processed, valid models will be located in the directory pointed by `COVEXPSUCCESS`

To train CLGen on Simulink corpus: 
```bash
$ bazel run //deeplearning/clgen -- --config=/path/to/the/config/file
```
# Example
```bash
$ bazel run //deeplearning/clgen -- --config=$PWD/deeplearning/clgen/tests/data/Simulink/config.pbtxt
```

To run test cases typical to this project: 
```bash
$ bazel test //deeplearning/clgen/preprocessors/...
```
 
