#!/bin/bash

if [[ -e /flag.sh ]]; then
	echo "[+] Init flag.sh"
	source /flag.sh
fi

if [[ -e /start.sh ]]; then
	echo "[+] Init start.sh"
	source /start.sh
fi

export FLAG=not_flag
FLAG=not_flag

echo "[+] Start Run xinetd"
exec /usr/sbin/xinetd -dontfork -stayalive &

sleep 2s
echo "[+] Xinetd Running..."
tail -F /var/log/xinetd.log