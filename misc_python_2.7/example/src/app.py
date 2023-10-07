#!/usr/bin/env python
# -*- coding:utf-8 -*-
import sys

def readflag():
    with open("/flag", "r") as f:
        ret = f.read()
    return ret

def main():
    flag = readflag()
    sys.stdout.write('Welcome to CTFHub\n')
    sys.stdout.write(flag)

if __name__ == "__main__":
    main()