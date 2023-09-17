#!/bin/bash
set -e

if [ -f /flag.sh ]; then
    echo "load flag"
    source /flag.sh
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- apache2-foreground "$@"
fi

echo "Running..."
exec "$@"