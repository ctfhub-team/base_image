#!/bin/bash
set -e

if [ -f /flag.sh ]; then
    echo "load flag"
    source /flag.sh
fi

nginx &

echo "Running..."
tail -F /var/log/nginx/*.log