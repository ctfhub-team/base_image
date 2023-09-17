#!/bin/bash
set -e

if [ -f /flag.sh ]; then
    echo "load flag"
    source /flag.sh
fi

php-fpm &
nginx &

echo "Running..."
tail -F /var/log/nginx/*.log