#!/bin/bash

echo "exp3a: Write a shell script to generate series of number multiply by 2"

# Check if an argument is provided

if [ -z "$1" ]; then

        echo "no argument provided"

        echo "Usage: $0 <max_number>"

  exit 1

fi



# Get the maximum number from the command line argument

max_number=$1



# Check if the provided argument is a valid number

if ! [[ "$max_number" =~ ^[0-9]+$ ]]; then

  echo "Error: The argument must be a positive integer."

  exit 1

fi



echo "---result---"

# Loop from 1 to the maximum number

for ((i=1; i<=max_number; i++)); do

  result=$((i * 2))

  echo "$i * 2 = $result"

done