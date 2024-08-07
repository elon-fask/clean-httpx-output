#!/bin/bash

# Function to display help
show_help() {
  echo "Usage: \$0 <filter_value> <output_file> <input_file>"
  echo
  echo "Filter lines from the input file that contain the specified filter value."
  echo
  echo "Arguments:"
  echo "  filter_value   The string to filter lines by."
  echo "  output_file    The file where filtered lines will be saved."
  echo "  input_file     The file to read lines from."
  echo
  echo "Options:"
  echo "  -h, --help     Show this help message."
}

# Check if help flag is provided
if [[ "\$1" == "-h" || "\$1" == "--help" ]]; then
  show_help
  exit 0
fi

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Error: Invalid number of arguments."
  show_help
  exit 1
fi

# Assign the filter value, output file, and input file to variables
filterBy="\$1"
output_file="\$2"
input_file="\$3"

# Clear the output file if it exists
>"$output_file"

# Read the input file line by line
while IFS= read -r line; do
  # Check if the line contains the filter value
  if [[ "$line" == *"$filterBy"* ]]; then
    # Write the line to the output file
    echo "$line" >>"$output_file"
  fi
done <"$input_file"

# Display the result
echo "Filtered lines with [$filterBy] have been saved to $output_file"

# Count and display the total number of lines in the output file
total_lines=$(wc -l <"$output_file")
echo "Total lines ===> $total_lines"
