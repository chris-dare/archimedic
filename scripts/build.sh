#!/bin/sh -e
# build docker image and push to docker hub

# LD_LIBRARY_PATH may not exist

echo "Building docker image for backend..."

export BACKEND_IMAGE_NAME=${BACKEND_IMAGE_NAME:-'chrisdare/archimedic:latest'}

echo "Building image with tag $BACKEND_IMAGE_NAME"

docker image build -t $BACKEND_IMAGE_NAME .
