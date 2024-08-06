#!/bin/bash

echo "exp3b: Write a shell script to generate all combinations of 1, 2 and 3"

echo "all combinations of 123 are:"

# Define the array of numbers

numbers=(1 2 3)

count=0

# Loop through all combinations

for i in "${numbers[@]}"; do

  for j in "${numbers[@]}"; do

    for k in "${numbers[@]}"; do

      echo "$i$j$k"

        ((count++))

        done

  done

done

echo "total combinations: $count"