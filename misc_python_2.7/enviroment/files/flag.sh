#!/bin/bash

echo $FLAG > /flag

chmod 444 /flag

export FLAG=not_flag
FLAG=not_flag

rm -f /flag.sh