"""Common preprocessor passes."""
from absl import flags

from deeplearning.clgen import errors
from deeplearning.clgen.preprocessors import public
import re


FLAGS = flags.FLAGS


def _MinimumLineCount(text: str, min_line_count: int) -> str:
  """Private implementation of minimum number of lines.

  Args:e
    text: The source to verify the line count of.

  Returns:
    src: The unmodified input src.

  Raises:
    NoCodeException: If src is less than min_line_count long.
  """
  if len(text.strip().split('\n')) < min_line_count:
    raise errors.NoCodeException
  return text


@public.clgen_preprocessor
def MinimumLineCount3(text: str) -> str:
  """Check that file contains a minimum number of lines.

  Args:
    text: The source to verify the line count of.

  Returns:
    src: The unmodified input src.

  Raises:
    NoCodeException: If src is less than min_line_count long.
  """
  return _MinimumLineCount(text, 3)


@public.clgen_preprocessor
def StripDuplicateEmptyLines(text: str) -> str:
  """A preprocessor pass which removes duplicate empty lines.

  Args:
    text: The text to preprocess.

  Returns:
    The input text, where duplicate empty lines have been removed.
  """
  last_line = None
  lines = []
  for line in text.split("\n"):
    if line.strip() or last_line:
      lines.append(line)
    last_line = line.rstrip()
  return "\n".join(lines)


@public.clgen_preprocessor
def StripTrailingWhitespace(text: str) -> str:
  """A preprocessor pass which strips trailing whitespace from all lines.

  Whitespace at the end of each line is removed, as is any trailing whitespace
  at the end of the input.

  Args:
    text: The text to preprocess.

  Returns:
    The input text, with trailing whitespace removed.
  """
  return '\n'.join(l.rstrip() for l in text.split('\n')).rstrip()

@public.clgen_preprocessor
def StripDuplicateWhiteSpaces(text: str) -> str:
  """

  Extra WhiteSpaces removed between Keywords and  and its assignment

  Args:
    text: The Simulink MdlFile source to preprocess.

  Returns:
    Simulink source code with middle or duplicate whitespaces stripped
  """
  last_line = None
  lines = []
  for line in text.split("\n"):
    line = line.replace(" \t","  ")
    line = re.sub("\s\s+"," ",line.lstrip())
    lines.append(line) 
  return "\n".join(lines)

@public.clgen_preprocessor
def RemoveAnnotationOnSimulink(text: str) -> str:
  """

  Remove Annotation{} and AnnotationDefaults{} blocks 

  Args:
    text: The Simulink MdlFile source to preprocess.

  Returns:
    Simulink source code with blocks removed
  """
  lines = []
  count = 0 
  for line in text.split("\n"):
    if count == 1 and line.strip()=='}':
      count = 0
      continue
    if count == 1:
      continue
    if(line.strip()=="Annotation {" or line.strip()=="AnnotationDefaults {"):
      count = 1
      continue
    lines.append(line) 
  return "\n".join(lines)

@public.clgen_preprocessor
def RemoveCommentsOnSimulink(text: str) -> str:
  """

  Remove Comments which start with #

  Args:
    text: The Simulink MdlFile source to preprocess.

  Returns:
    Simulink source code with comments removed
  """
  lines = []
  count = 0
  for line in text.split("\n"):
    line = line.lstrip()
    if line != '':
      if line[0] == '#':
        continue
    lines.append(line)
  return "\n".join(lines)

@public.clgen_preprocessor
def RemoveUnnecessaryOnSimulink(text: str) -> str:
  """

  Remove Unnecessary keywords

  Args:
    text: The Simulink MdlFile source to preprocess.

  Returns:
    Simulink source code with Unnecessary keywords removed
  """
  lines = []
  count = 0
  for line in text.split("\n"):
    line = line.lstrip()
    if line.startswith('Position') or line.startswith('ZOrder'):
      continue
    lines.append(line)
  return "\n".join(lines)