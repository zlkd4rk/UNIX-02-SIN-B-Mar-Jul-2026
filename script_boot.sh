cd #change directory
cd /home/codespace #It takes you to a specific location starting from the "root" of the system
cd ~ #Fast access to the home directory.
cd $HOME #variable valid for the entire operating system

mkdir #make directory called proyecto 
cd proyecto/ #change directory to the proyecto/ folder.
ls -lai #list with (l=long) showing the information like permisssions, owner of the folder and date of modification, (a=all) showing hidden files (. and ..), (i=inode) show the inode number.
#Result
total 12
925560 drwxr-xr-x 2 codespace codespace 4096 Apr  6 12:33 .
918515 drwxr-x--- 1 codespace codespace 4096 Apr  6 12:33 ..