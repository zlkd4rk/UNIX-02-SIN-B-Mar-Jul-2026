#!/bin/bash
for file in example_file*; do #For each file select all the file beginning with example_file
if [[ "${file}" == "example_file1" ]]; then #If the example file equals example_file1 print Skipping file
echo "Skipping the first file"
continue #The loop continues and end the if
fi
echo "${RANDOM}" > "${file}" #So skipped the example_file1 put a random number in the other files
#Also you can create another file with the name example_file(anaything you want) and the script put a random number in it excepting in the example_file1
done