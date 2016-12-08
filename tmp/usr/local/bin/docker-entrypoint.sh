#!/usr/bin/env bash

set -eo pipefail

# start postfix
postfix start

# run xdebug setup
/usr/local/bin/setup-xdebug -n --no-prompt

# start CMD defined in Dockerfile
exec "$@"