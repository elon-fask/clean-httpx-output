#!/bin/bash

# checl if filrer value, output file, and input file are provided
if [ "$#" -ne 3]; then
  echo "Usage: $0 <filter_value> <output_file> <input_file>"
  exit 1
fi

# assign the filter value, output file and input file tp variables
filterBy="$1"
output_file="$2"
input_file="$3"

# clear the output file if it exists
>"$output_file"

# read the input file line by line
while IFS= read -r line; do
  # check if the line contains '[SUCCESS]'
  if [[ "$line" == *"$filterBy"* ]]; then
    #write thr line to the output file
    echo "$line" >>"$output_file"
  fi
done <"$input_file"

echo "Filtered lines with ["$filterBy"] have been saved to $output_file"

echo "total lines ===> " | cat "$output_file" | wc -l
