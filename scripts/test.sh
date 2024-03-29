#!/usr/bin/env bash

set -e
set -x

# For tests, a large terminal width
export TERMINAL_WIDTH=3000
# Force disable terminal for tests inside of pytest, takes precedence over GITHUB_ACTIONS env var
export _TYPER_FORCE_DISABLE_TERMINAL=1 # TODO: check if this is relevant to this project code
# bash ./scripts/test-files.sh
# It seems xdist-pytest ensures modified sys.path to import relative modules in examples keeps working
pytest --cov-config=.coveragerc --cov --cov-report=term-missing -o console_output_style=progress --numprocesses=auto ${@}
