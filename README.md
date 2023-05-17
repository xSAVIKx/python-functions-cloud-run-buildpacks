Python Functions Cloud Run Buildpacks demo
-----------

This repository contains a real-world-like example of a Python application built on top of the
[functions-framework](https://github.com/GoogleCloudPlatform/functions-framework-python) and
deployed as a [Cloud Run](https://cloud.google.com/run) service using customized
[buildpacks](https://github.com/GoogleCloudPlatform/buildpacks)-based build.

# Building locally

In order to build the image locally, please use the [`build.sh`](./build.sh) script. Specify
the `FULL_IMAGE_NAME` that is the name of the image (including repo details) prior to running
the script.
