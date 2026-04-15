touch prueba.txt #Create a new file called prueba.txt using the touch command.
chmod 600 prueba.txt #Change the permissions of the file prueba.txt to 600,  only the owner of the file has read and write permission (4+2=6), an the group and other has cero permissions (0).
ls -l prueba.txt  #See the permissions of the file.
chmod 755 prueba.txt #Change the permissions of the file prueba.txt to 755, the owner has read, write and execute, the group and other has read and execute permissions (4+1=5).
ls -l prueba.txt  #See the permissions of the file.
