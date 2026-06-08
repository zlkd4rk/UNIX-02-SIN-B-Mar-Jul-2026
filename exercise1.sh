#!/bin/bash
FIRST_NAME="${1}" #First Argument

LAST_NAME="${2}" #Second Argument

touch output.txt #Create the file to save the output of the commands

date +%M-%d-%Y >> output.txt  #Save the date into a MM/DD/YY format

echo "${FIRST_NAME} ${LAST_NAME}" >> output.txt #Echo to the arguments ans save it into output.txt

cp output.txt backup.txt #Copy the file and create a new one called backup.txt

cat output.txt #At the end cat the file and see the content
#Also you can cat the backup.txt file to see the same result


