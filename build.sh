#!/usr/bin/env bash

poetry export --no-interaction --without-hashes --format requirements.txt --output requirements.txt

MODULE_NAME="python-functions-cloud-run-buildpacks"
IMAGE_NAME="gcr.io/${PROJECT_ID}/cloud-run-buildpacks"
MODULE_VERSION=$( poetry version | sed "s/^.*${MODULE_NAME}\s//g" )
GIT_SHA=$( git rev-parse HEAD )

pack build "${IMAGE_NAME}" \
  --descriptor "project.toml" \
  --builder "gcr.io/buildpacks/google-22/builder:latest" \
  --run-image "gcr.io/buildpacks/google-22/run:latest" \
  --clear-cache \
  --tag "${IMAGE_NAME}:latest" \
  --tag "${IMAGE_NAME}:${GIT_SHA}" \
  --tag "${IMAGE_NAME}:${GIT_SHA:0:7}" \
  --tag "${IMAGE_NAME}:${MODULE_VERSION}" \
  --publish
