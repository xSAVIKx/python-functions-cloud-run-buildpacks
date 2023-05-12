import sys
from io import StringIO

from python_functions_cloud_run_buildpacks.example import echo


class TestEcho:
    def test_echo(self):
        captured_output = StringIO()
        sys.stdout = captured_output
        echo(value="aaa")
        sys.stdout = sys.__stdout__
        assert "Echoing the given: value='aaa'\n" == captured_output.getvalue()
