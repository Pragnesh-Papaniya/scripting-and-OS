#!/bin/bash

if [ $# -ne 2 ]; then
    echo "Usage: $0 file1 file2"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "File $1 does not exist."
    exit 1
fi

if [ ! -f "$2" ]; then
    echo "File $2 does not exist."
    exit 1
fi

diff "$1" "$2" > /dev/null

if [ $? -eq 0 ]; then
    echo "Files are identical."
else
    echo "Files are different."
fi
