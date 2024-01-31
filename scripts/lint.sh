#!/usr/bin/env bash

set -e
set -x

mypy archimedic api
black archimedic tests --check
isort archimedic tests --check-only
