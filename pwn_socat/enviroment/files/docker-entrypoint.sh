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

if [[ -e /app/ld.so && -e /app/libc.so ]]; then
    echo "[+] patchelf"
    patchelf --replace-needed libc.so.6 /app/libc.so /app/pwn
    patchelf --set-interpreter /app/ld.so /app/pwn
    echo ldd /app/pwn
    ldd /app/pwn
fi

echo "[+] change /app privilege"
chmod +x /app/run.sh
chown -R pwn:pwn /app

echo "Start Run Pwn"
socat tcp-listen:10000,reuseaddr,fork,su=pwn exec:/app/run.sh
