import flask
import functions_framework

from python_functions_cloud_run_buildpacks.example import echo


@functions_framework.http
def handle(request: flask.Request):  # type: ignore
    """
    Given a start airport city, end airport city, and number of days
    generate a day to day travelplan.
    """
    # Unwrap & parse request
    request_json = request.get_json(silent=True)
    echo(request_json)
    return {"OK"}
