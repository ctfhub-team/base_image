#!/bin/bash

if [[ -f /pwn ]]; then
    chown root:pwn /pwn
    chmod 750 /pwn
fi

if [[ -f /flag.sh ]]; then
    source /flag.sh
fi

export FLAG=not_flag
FLAG=not_flag

echo "Start Run Pwn"
socat tcp-listen:10000,reuseaddr,fork,su=pwn exec:/pwn
