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

import pytest
from absl import app

from deeplearning.clgen import model
from deeplearning.clgen.tests import testlib as tests


def get_test_model(vocab="char"):
  return model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus"),
               "vocabulary": vocab},
    "architecture": {"rnn_size": 8, "num_layers": 2},
    "train_opts": {"epochs": 1}})


def test_model_hash():
  m1 = model.Model.from_json({"corpus": {"language": "opencl",
                                         "path": tests.data_path("tiny",
                                                                 "corpus")}})

  # same as m1, with explicit default opt:
  m2 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": True}})

  # different opt value:
  m3 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": False}})

  assert m1.hash == m2.hash
  assert m2.hash != m3.hash


def test_model_checkpoint_path_untrained():
  m = get_test_model()
  m.cache.clear()  # untrain
  assert m.checkpoint_path == None


def test_model_eq():
  m1 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": False}})
  m2 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": False}})
  m3 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": True}})

  assert m1 == m2
  assert m2 != m3
  assert m1 != False
  assert m1 != 'abcdef'


def test_model_to_json():
  m1 = model.Model.from_json({
    "corpus": {"language": "opencl", "path": tests.data_path("tiny", "corpus")},
    "train_opts": {"intermediate_checkpoints": True}})
  m2 = model.Model.from_json(m1.to_json())
  assert m1 == m2


def main(argv):
  """Main entry point."""
  if len(argv) > 1:
    raise app.UsageError('Unrecognized command line flags.')
  sys.exit(pytest.main([__file__, '-v']))


if __name__ == '__main__':
  app.run(main)
