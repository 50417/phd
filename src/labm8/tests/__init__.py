import unittest

# Extension of unittest's TestCase.
class TestCase(unittest.TestCase):

    @staticmethod
    def _print(obj, **kwargs):
        if hasattr(obj, "__iter__") and not isinstance(obj, str):
            print([str(x) for x in obj], **kwargs)
        else:
            print(str(obj), **kwargs)

    # A convenience method to assert that expected result equals
    # actual result. The benefit over just calling assertTrue() is
    # that it prints the expected and actual values if the test fails.
    def _test(self, expected, actual):
        print("Expected:", end="")
        self._print(expected)
        print("Actual:", end="")
        self._print(actual)
        self.assertTrue(actual == expected)
