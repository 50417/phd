"""Unit tests for //deeplearning/clgen/atomizers.py."""

import sys

import unittest
import atomizers 

class MyTest(unittest.TestCase):
  # The set of multichar tokens for the OpenCL programming language.
  SIMULINK_ATOMS = set(
      ['  ', 'Model', 'GraphicalInterface', 'IsExportFunctionModel', 'CheckSSInitialOutputMsg',
       'CheckExecutionContextRuntimeOutputMsg', 'BlockDefaults', 'Line',
       'DstPort', 'Name', 'MinMaxOverflowArchiveMode',
        ])
  def test_GreedyAtomizer_AtomizeString1():
    c = atomizers.GreedyAtomizer({'a': 1, 'b': 2, 'c': 3})
    assert list(c.AtomizeString('abcabc')) == [1, 2, 3, 1, 2, 3]

  def test_GreedyAtomizer_AtomizeString2():
    test_in = """B
  """

    c = atomizers.GreedyAtomizer.FromText(test_in, SIMULINK_ATOMS)
    print(list(c.AtomizeString(test_in)))
    assert list(c.AtomizeString(test_in)) == [1,0]



if __name__ == "__main__":
    unittest.main()
