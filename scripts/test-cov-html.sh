#!/usr/bin/env bash

# Code snippet from Tiango's FastAPI API template

set -e
set -x

bash scripts/test.sh --cov-report=html ${@}
