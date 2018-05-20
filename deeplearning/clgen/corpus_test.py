#
# Copyright 2016, 2017, 2018 Chris Cummins <chrisc.101@gmail.com>.
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
import sys

import numpy as np
import pytest
from absl import app

from deeplearning.clgen import corpus
from deeplearning.clgen import errors
from deeplearning.clgen.tests import testlib as tests
from lib.labm8 import fs


TINY_HASH = 'b5c2c4f07ef6f1a6423d079a07392411e49891ed'


def test_path():
  path = tests.archive("tiny", "corpus")
  c = corpus.Corpus.from_json(
    {"language": "opencl", "id": TINY_HASH, "path": path})
  assert TINY_HASH == c.hash


def test_badpath():
  with pytest.raises(errors.CLgenError):
    corpus.Corpus("notarealid", path="notarealpath")


def test_from_archive():
  # delete any existing unpacked directory
  fs.rm(tests.data_path("tiny", "corpus", exists=False))

  c = corpus.Corpus.from_json({"language": "opencl",
                               "path": tests.data_path("tiny", "corpus",
                                                       exists=False)})
  assert TINY_HASH == c.hash


def test_from_archive_path():
  # delete any existing unpacked directory
  fs.rm(tests.data_path("tiny", "corpus", exists=False))

  c = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.data_path("tiny", "corpus.tar.bz2")})
  assert TINY_HASH == c.hash


def test_hash():
  c1 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus")})

  # same as c1, with explicit default opt:
  c2 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus"),
     "eof": False})

  # different opt value:
  c3 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus"),
     "eof": True})

  assert c1.hash == c2.hash
  assert c2.hash != c3.hash


def test_get_features():
  code = """\
__kernel void A(__global float* a) {
  int b = get_global_id(0);
  a[b] *= 2.0f;
}"""
  assert np.array_equal(clgen.get_kernel_features(code),
                        [0, 0, 1, 0, 1, 0, 1, 0])


def test_get_features_bad_code():
  code = """\
__kernel void A(__global float* a) {
  SYNTAX ERROR!
}"""
  with tests.DevNullRedirect():
    with pytest.raises(clgen.FeaturesError):
      clgen.get_kernel_features(code, quiet=True)


def test_get_features_multiple_kernels():
  code = """\
__kernel void A(__global float* a) {}
__kernel void B(__global float* a) {}"""

  with pytest.raises(clgen.FeaturesError):
    clgen.get_kernel_features(code)


def test_no_language():
  with pytest.raises(errors.UserError):
    corpus.Corpus.from_json({"path": tests.archive("tiny", "corpus"), })


def test_bad_language():
  with pytest.raises(errors.UserError):
    corpus.Corpus.from_json(
      {"language": "NOTALANG", "path": tests.archive("tiny", "corpus"), })


def test_bad_option():
  with pytest.raises(errors.UserError):
    corpus.Corpus.from_json(
      {"language": "opencl", "path": tests.archive("tiny", "corpus"),
       "not_a_real_option": False})


def test_bad_vocab():
  with pytest.raises(errors.UserError):
    corpus.Corpus.from_json(
      {"language": "opencl", "path": tests.archive("tiny", "corpus"),
       "vocab": "INVALID_VOCAB"})


@pytest.mark.xfail(reason="FIXME: UserError not raised")
def test_bad_encoding():
  with pytest.raises(errors.UserError):
    corpus.Corpus.from_json(
      {"language": "opencl", "path": tests.archive("tiny", "corpus"),
       "encoding": "INVALID_ENCODING"})


def test_eq():
  c1 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus"),
     "eof": False})
  c2 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus"),
     "eof": False})
  c3 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus"),
     "eof": True})

  assert c1 == c2
  assert c2 != c3
  assert c1 != 'abcdef'


def test_preprocessed():
  c1 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus")})
  assert len(list(c1.preprocessed())) == 187
  assert len(list(c1.preprocessed(1))) == 56
  assert len(list(c1.preprocessed(2))) == 7


def test_contentfiles():
  c1 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus")})
  assert len(list(c1.contentfiles())) == 250


def test_to_json():
  c1 = corpus.Corpus.from_json(
    {"language": "opencl", "path": tests.archive("tiny", "corpus")})
  c2 = corpus.Corpus.from_json(c1.to_json())
  assert c1 == c2


def main(argv):
  """Main entry point."""
  if len(argv) > 1:
    raise app.UsageError('Unrecognized command line flags.')
  sys.exit(pytest.main([__file__, '-v']))


if __name__ == '__main__':
  app.run(main)
