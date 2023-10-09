#!/bin/bash
set -e

if [[ -e /flag.sh ]]; then
	echo "[+] Init flag.sh"
	source /flag.sh
	rm /flag.sh && unset FLAG
fi

if [[ -e /start.sh ]]; then
	echo "[+] Init start.sh"
	source /start.sh
	rm /start.sh
fi

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
    set -- apache2-foreground "$@"
fi

echo "Running..."
exec "$@"