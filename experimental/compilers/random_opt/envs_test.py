"""Unit tests for //experimental/compilers/random_opt/envs.py."""
import gym
import pytest
import sys
import typing
from absl import app
from absl import flags

from experimental.compilers.random_opt import envs


FLAGS = flags.FLAGS


@pytest.mark.parametrize('environment', envs.ENVIRONMENTS)
def test_environments(environment: str):
  """Simple black box test of environment."""
  env = gym.make(environment)
  env.seed(0)
  env.reset()
  # Take a random step. We're doing a full test, just checking that we can at
  # least take a step without error.
  env.render()
  env.step(env.action_space.sample())
  env.render()


def main(argv: typing.List[str]):
  """Main entry point."""
  if len(argv) > 1:
    raise app.UsageError("Unknown arguments: '{}'.".format(' '.join(argv[1:])))
  sys.exit(pytest.main([__file__, '-vv']))


if __name__ == '__main__':
  flags.FLAGS(['argv[0]', '-v=1'])
  app.run(main)
