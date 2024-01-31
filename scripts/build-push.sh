#!/bin/sh -e
# build and run docker container

echo "Shutting down running instances..."
docker compose down -v

sh ./scripts/build.sh

echo "Publishing $BACKEND_IMAGE_NAME..."
docker image push $BACKEND_IMAGE_NAME
