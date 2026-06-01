#! /bin/bash
set -x
# All this script does is create a directory, create a file# within the directory, and then list the contents of the di rectory. 
mkdir mydirectory 
touch mydirectory/myfile 
ls -l mydirectory

#bash -n blackhatbash2.sh
#Print nothing because is not a syntaxis errors in the script 
#bash -x blackhatbash2.sh
#Print the command the script execute with + at the beginning, and also print the result of the command ls -l mydirectory.
#+ mkdir mydirectory
#+ touch mydirectory/myfile
#+ ls -l mydirectory
#total 0
#-rw-rw-rw- 1 root root 0 jun  1 13:21 myfile

set +x
# + mkdir mydirectory
# mkdir: cannot create directory ‘mydirectory’: El fichero ya existe
# + touch mydirectory/myfile
# + ls -l mydirectory
# total 0
# -rw-rw-rw- 1 root root 0 jun  1 13:24 myfile
# + set +x
#Set -x start a debugging mode and set +x finish it, and also print into a verbose mode.
