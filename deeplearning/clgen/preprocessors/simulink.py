"""Preprocessor passes for the Simulink programming language. Preprocesses mdl files only -- """
import typing

from absl import flags

from deeplearning.clgen.preprocessors import clang
from deeplearning.clgen.preprocessors import normalizer
from deeplearning.clgen.preprocessors import public
from phd.lib.labm8 import bazelutil




@public.simulink_preprocessor
def NormalizeIdentifiers(text: str) -> str:
  """Normalize identifiers in Simunlink Mdl source file.

  Args:
    text: The source code to rewrite.

  Returns:
    Source code with identifier names normalized.

  Raises:
    RewriterException: If rewriter found nothing to rewrite.
    ClangTimeout: If rewriter fails to complete within timeout_seconds.
  """
  return normalizer.NormalizeIdentifiers(
      text, '.cl', GetClangArgs(use_shim=False))


