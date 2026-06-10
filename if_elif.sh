#!/bin/bash
USER_INPUT="${1}" #Create global variable as argument.

# Check if the user provided an argument
if [[ -z "${USER_INPUT}" ]]; then #This line analys the arguemnt is null
  echo "You must provide an argument!"
  exit 1
fi

# Check if the argument is of type file or directory
if [[ -f "${USER_INPUT}" ]]; then #With the arugment provided analys
#if the argument is a file print a message
 echo "${USER_INPUT} is a file."
elif [[ -d "${USER_INPUT}" ]]; then 
#This is other if using elif instead writeng multiples if, so analys the arguments is a directory
  echo "${USER_INPUT} is a directory."
else
#If the last two blocks fail prints the arguments is not a file o directory.
  echo "${USER_INPUT} is not a file or a directory."
fi