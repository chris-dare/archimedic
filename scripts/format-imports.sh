#!/bin/sh -e
set -x

# Sort imports one per line, so autoflake can remove unused imports
isort --force-single-line-imports archimedic tests docs_src
sh ./scripts/format.sh
