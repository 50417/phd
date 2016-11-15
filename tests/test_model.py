#
# Copyright 2016 Chris Cummins <chrisc.101@gmail.com>.
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
from unittest import TestCase, skip, skipIf
import tests

import json
import re

from labm8 import fs

import clgen
from clgen import model


def get_test_model():
    return model.from_json({
        "corpus": {
            "path": tests.data_path("tiny", "corpus"),
        },
        "train_opts": {
            "model_type": "lstm",
            "rnn_size": 8,
            "num_layers": 2,
            "max_epochs": 1
        }
    })


class TestModel(TestCase):
    def test_most_recent_checkpoint_untrained(self):
        m = get_test_model()
        m.cache.empty()  # untrain
        self.assertEqual(m.most_recent_checkpoint, None)

    def test_meta_untrained(self):
        m = get_test_model()
        m.cache.empty()  # untrain
        # meta is only accesible on a trained model
        with self.assertRaises(model.DistError):
            m.meta

    def test_meta(self):
        m = get_test_model()
        m.train()
        meta = m.meta

        # meta format spec: https://github.com/ChrisCummins/clgen/issues/25

        # version
        self.assertEqual(meta["version"], clgen.version())
        # author
        self.assertTrue(type(meta["author"]) is str)
        self.assertNotEqual(meta["author"], "")
        # date packaged
        self.assertTrue(type(meta["date packaged"]) is str)
        self.assertNotEqual(meta["date packaged"], "")
        # contents
        contents = meta["contents"]
        self.assertEqual(len(contents), 2)
        t7_ = m.most_recent_checkpoint
        self.assertEqual(contents["model.t7"], clgen.checksum_file(t7_))
        json_ = re.sub(r".t7$", ".json", m.most_recent_checkpoint)
        self.assertEqual(contents["model.json"], clgen.checksum_file(json_))
        # train opts
        self.assertEqual(meta["train_opts"], m.train_opts)
