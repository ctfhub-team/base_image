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

sleep 999999999