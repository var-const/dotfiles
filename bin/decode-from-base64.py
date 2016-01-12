#!/bin/python3

from email.header import decode_header
from sys import argv

def main():
    msg, encoding = decode_header(argv[1])[0]
    if encoding:
        print(msg.decode(encoding))
    else:
        print(msg)

if __name__ == '__main__':
    main()
