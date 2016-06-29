# Copyright (C) 2015 Chris Cummins.
#
# Labm8 is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free
# Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# Labm8 is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
# or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
# License for more details.
#
# You should have received a copy of the GNU General Public License
# along with labm8.  If not, see <http://www.gnu.org/licenses/>.
from unittest import main
from tests import TestCase

import labm8 as lab
from labm8 import fmt

class TestFmt(TestCase):

    # table()
    def test_table(self):
        if lab.is_python3():
            self._test("foo  1\n"
                       "bar  2",
                       fmt.table((("foo", 1), ("bar", 2))))
        else:
            self._test(" foo  1\n"
                       " bar  2",
                       fmt.table((("foo", 1), ("bar", 2))))

    def test_table_columns(self):
        if lab.is_python3():
            self._test("type  value\n"
                       "foo      1\n"
                       "bar      2",
                       fmt.table((("foo", 1), ("bar", 2)),
                                 columns=("type", "value")))
        else:
            self._test("type  value\n"
                       " foo      1\n"
                       " bar      2",
                       fmt.table((("foo", 1), ("bar", 2)),
                                 columns=("type", "value")))

    def test_table_bad_columns(self):
        with self.assertRaises(fmt.Error):
            fmt.table((("foo", 1), ("bar", 2)),
                      columns=("type", "value", "too", "many", "values"))

    def test_table_bad_rows(self):
        with self.assertRaises(fmt.Error):
            fmt.table((("foo", 1), ("bar", 2), ("car",)))


if __name__ == '__main__':
    main()
