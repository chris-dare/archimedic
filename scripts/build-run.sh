#!/bin/sh -e
# build and run docker container

echo "Shutting down running instances..."
docker compose down -v

sh ./scripts/build.sh

docker compose -f docker-compose-dev.yml up -d
