#!/bin/bash
# This function checks if the current user ID equals to zero
check_if_root(){
  if [[ "${EUID}" -eq "0" ]]; then #Compare the Effective User ID to zero
  #Zero is for root
    return 0
  else
  #One if the user is not root
    return 1
  fi
}

if check_if_root; then #Call the function and if the exit is cero the user is root and the process is success
  echo "User is root!"
else
#Else the ID is not zero the user is not root so the process fail and print this block
  echo "User is not root!"
fi

#Create a new user called "Tilin" using useradd 
#To moving to the user called "Tilin" and prints "User is not root!"