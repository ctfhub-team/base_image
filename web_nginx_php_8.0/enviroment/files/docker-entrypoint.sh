#!/bin/bash

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

php-fpm &
nginx &

echo "Running..."
tail -F /var/log/nginx/*.log