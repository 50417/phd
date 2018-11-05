"""Unit tests for ///common_test.py."""
import sys

import pytest
from absl import app
from absl import flags

from deeplearning.clgen import errors
from deeplearning.clgen.preprocessors import common


FLAGS = flags.FLAGS


# MinimumLineCount3() tests.

def test_MinimumLineCount3_empty_input():
  """Test that MinimumLineCount3 rejects an empty input."""
  with pytest.raises(errors.NoCodeException):
    common.MinimumLineCount3('')


def test_MinimumLineCount3_whitespace_does_not_count():
  """Test that MinimumLineCount3 rejects ignores whitespace."""
  with pytest.raises(errors.NoCodeException):
    common.MinimumLineCount3('\n\n  \n\n  \n\n   \n\n')


def test_MinimumLineCount3_simple_program():
  """Test that MinimumLineCount3 accepts a program with 3 lines."""
  assert common.MinimumLineCount3("""
int main(int argc, char** argv) {
  return 0;
}  
""") == """
int main(int argc, char** argv) {
  return 0;
}  
"""

def test_RemoveAnnotationOnSimulink_program():
  """Test that RemoveAnnotationOnSimulink produce correct output """

  assert common.RemoveAnnotationOnSimulink("""
Annotation {
  name value
}
AnnotationDefaults {
  parameter value
  param2 value
} 
""") == """
"""

def test_RemoveCommentsOnSimulink_program():
  """Test that RemoveCommentsOnSimulink produce correct output """

  assert common.RemoveCommentsOnSimulink("""
# 123
Model{
# Name
}
""") == """
Model{
}
"""

def test_RemoveUnnecessaryOnSimulink_program():
  """Test that RemoveUnnecessaryOnSimulink produce correct output """

  assert common.RemoveUnnecessaryOnSimulink("""
Model{
Name test
Position [1,2]
ZOrder 3
}
""") == """
Model{
Name test
}
"""

# StripDuplicateEmptyLines() tests.
def test_StripDuplicateEmptyLines_empty_input():
  """Test StripDuplicateEmptyLines accepts an empty input."""
  assert common.StripDuplicateEmptyLines('') == ''

def test_SStripDuplicateWhiteSpaces_empty_input():
  """Test StripDuplicateWhiteSpaces accepts an empty input."""
  assert common.StripDuplicateWhiteSpaces('') == ''

def test_RemoveAnnotationOnSimulink_empty_input():
  """Test RemoveAnnotationOnSimulink accepts an empty input."""
  assert common.RemoveAnnotationOnSimulink('') == ''

def test_RemoveCommentsOnSimulink_empty_input():
  """Test RemoveCommentsOnSimulink accepts an empty input."""
  assert common.RemoveCommentsOnSimulink('') == ''

def test_RemoveUnnecessaryOnSimulink_empty_input():
  """Test RemoveUnnecessaryOnSimulink accepts an empty input."""
  assert common.RemoveUnnecessaryOnSimulink('') == ''

# Benchmarks.

HELLO_WORLD_C = """
#include <stdio.h>

int main(int argc, char** argv) {
  printf("Hello,   world!\\n");
  return 0;
}
"""
ANNOTATION_SIMULINK= """

Annotation {
  name value
}
AnnotationDefaults{
  parameter value
  param2 value
}
"""

COMMENTS_SIMULINK= """
# 123
Model{
# Name
}
"""

Unnecessary_SIMULINK= """
Model{
Name test
Position [1,2]
ZOrder 3
}
"""


def test_benchmark_MinimumLineCount3_c_hello_world(benchmark):
  """Benchmark MinimumLineCount3 on a "hello world" C program."""
  benchmark(common.MinimumLineCount3, HELLO_WORLD_C)


def test_benchmark_StripDuplicateEmptyLines_c_hello_world(benchmark):
  """Benchmark StripDuplicateEmptyLines on a "hello world" C program."""
  benchmark(common.StripDuplicateEmptyLines, HELLO_WORLD_C)

def test_benchmark_StripDuplicateWhiteSpaces_c_hello_world(benchmark):
  """Benchmark StripDuplicateWhiteSpaces on a "hello world!" C program."""
  benchmark(common.StripDuplicateWhiteSpaces, HELLO_WORLD_C)

def test_benchmark_RemoveAnnotation(benchmark):
  """Benchmark RemoveAnnotationOnSimulink on a "ANNOTATION_SIMULINK"""
  benchmark(common.RemoveAnnotationOnSimulink, ANNOTATION_SIMULINK)

def test_benchmark_RemoveComments(benchmark):
  """Benchmark RemoveCommentsOnSimulink on a "COMMENTS_SIMULINK"""
  benchmark(common.RemoveCommentsOnSimulink, COMMENTS_SIMULINK)

def test_benchmark_RemoveUnnecessary(benchmark):
  """Benchmark RemoveUnnecessaryOnSimulink on a "Unnecessary_SIMULINK"""
  benchmark(common.RemoveUnnecessaryOnSimulink, Unnecessary_SIMULINK)

def main(argv):
  """Main entry point."""
  del argv
  sys.exit(pytest.main([__file__, '-vv']))


if __name__ == '__main__':
  app.run(main)
