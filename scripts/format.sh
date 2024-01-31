#!/bin/sh -e
set -x

autoflake --remove-all-unused-imports --recursive --remove-unused-variables --in-place archimedic api tests --exclude=__init__.py
black archimedic tests
isort archimedic tests
