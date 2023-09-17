#!/bin/bash

if [[ -e /flag.sh ]]; then
	source /flag.sh
fi

if [[ -e /pwn ]]; then
	chown root:pwn /pwn
	chmod 750 /pwn
fi

export FLAG=not_flag
FLAG=not_flag

echo "Start Run xinetd"
exec /usr/sbin/xinetd -dontfork -stayalive &

sleep 2s
echo "Xinetd Running..."
tail -F /var/log/xinetd.log