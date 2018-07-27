"""Unit tests for //experimental/hotcrp/json_to_acm_proceedings.py."""
import io
import pytest
import sys
from absl import app
from absl import flags

from experimental.hotcrp import json_to_acm_proceedings


FLAGS = flags.FLAGS


def test_JsonToCsv():
  """Simple end-to-end test with dummy data."""
  buf = io.StringIO()
  json_to_acm_proceedings.JsonToCsv([
    {
      "pid": 1,
      "title": "A Very Good Paper",
      "decision": "Accepted",
      "status": "Accepted",
      "submitted": True,
      "submitted_at": 1523476493,
      "authors": [
        {
          "email": "joe@bloggs.edu",
          "first": "Joe",
          "last": "Bloggs",
          "affiliation": "University of Joe, Manchester",
          "contact": True
        },
        {
          "email": "example@yahoo.ac.uk",
          "first": "Eve A.",
          "last": "Example",
          "affiliation": "UoE",
          "contact": True
        }
      ],
      "abstract": "This is a very good paper.",
      "submission": {
        "mimetype": "application\/pdf",
        "hash": "sha2-11111126b5f3e0eccccabdb2398fafe26acc72e53795aa2b601ea509c2413a11",
        "timestamp": 1523476493,
        "size": 342929
      },
      "pc_conflicts": {
        "conflict@pc.com": "collaborator",
        "conflict2@pc.com": "confirmed",
      },
      "collaborators": ""
    }
  ], buf)
  assert buf.getvalue().rstrip() == (
    '"Full Paper",'
    '"A Very Good Paper",'
    '"Joe Bloggs:University of Joe, Manchester;Eve A. Example:UoE",'
    '"joe@bloggs.edu",'
    '"example@yahoo.ac.uk"')


def main(argv):
  """Main entry point."""
  if len(argv) > 1:
    raise app.UsageError("Unknown arguments: '{}'.".format(' '.join(argv[1:])))
  sys.exit(pytest.main([__file__, '-vv']))


if __name__ == '__main__':
  flags.FLAGS(['argv[0]', '-v=1'])
  app.run(main)