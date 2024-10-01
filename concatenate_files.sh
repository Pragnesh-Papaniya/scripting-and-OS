#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 output_file file1 [file2 ...]"
    exit 1
fi

output_file="$1"

cat "$@" > "$output_file"
echo "All files have been concatenated into $output_file."
