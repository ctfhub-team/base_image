#!/bin/bash
set -e

if [ -f /flag.sh ]; then
    echo "load flag"
    source /flag.sh
fi

echo "Running..."
service apache2 start
tail -f /var/log/apache2/*