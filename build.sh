#!/usr/bin/env bash

FULL_IMAGE_NAME="${FULL_IMAGE_NAME}"

poetry export --no-interaction --without-hashes --format requirements.txt --output requirements.txt

MODULE_NAME="python-functions-cloud-run-buildpacks"
MODULE_VERSION=$( poetry version | sed "s/^.*${MODULE_NAME}\s//g" )
GIT_SHA=$( git rev-parse HEAD )

pack build "${FULL_IMAGE_NAME}" \
  --descriptor "project.toml" \
  --builder "gcr.io/buildpacks/google-22/builder:latest" \
  --run-image "gcr.io/buildpacks/google-22/run:latest" \
  --clear-cache \
  --tag "${FULL_IMAGE_NAME}:latest" \
  --tag "${FULL_IMAGE_NAME}:${GIT_SHA}" \
  --tag "${FULL_IMAGE_NAME}:${GIT_SHA:0:7}" \
  --tag "${FULL_IMAGE_NAME}:${MODULE_VERSION}" \
  --publish
