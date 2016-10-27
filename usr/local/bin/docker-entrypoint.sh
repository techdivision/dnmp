#!/usr/bin/env bash

set -eo pipefail

# run xdebug setup
/usr/local/bin/setup-xdebug -n --no-prompt

exec "$@"