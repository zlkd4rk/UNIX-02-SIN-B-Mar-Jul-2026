#!/bin/bash
SIGNAL_TO_STOP_FILE="stoploop" #Define a variable with the name to stop de loop

# This loop will run until the file "stoploop" is available.
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do #Check if the file exist 
  echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exist..."
  echo "Checking again in 2 seconds..."
  #How the file dosent exist print a infinte echos for the file dosent exist
  sleep 2
done
#Use a split terminal and create the file using touch stoploop and the loop stops.
echo "File was found! Exiting..."
