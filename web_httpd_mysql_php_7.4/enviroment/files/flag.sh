#!/bin/bash
echo ${FLAG} > /flag

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh