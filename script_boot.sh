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


stat . #See the metadata of the directory/file
#512 bytes per block (Posix).
  File: .
  Size: 4096            Blocks: 8          IO Block: 4096   directory
Device: 0,45 # Major and minor, 0 cuz the fylesystem is not a real disc, 45 minimun specific number for taht instance.

    Inode: 925560      Links: 2
Access: (0755/drwxr-xr-x)  Uid: ( 1000/codespace)   Gid: ( 1000/codespace)
Access: 2026-04-06 12:34:47.154366038 +0000
Modify: 2026-04-06 12:33:51.818368401 +0000
Change: 2026-04-06 12:33:51.818368401 +0000
 Birth: 2026-04-06 12:33:51.818368401 +0000

mkdir -p /tmp/prueba/sub1 /tmp/prueba/sub2 #create more than one directorys at the same time.
stat /tmp/prueba #see all the medata
man mkdir #Manual of mkdir command.

pwd #Print working directory, wher i am working
whoami #The user a login (codesapce)
ls #List only the names of files and folders
ls -l #Show the list in a long format
ls -la # Includes the hide files (. and ..).
ls -lh #(h= human readable).
ls -lt #When the file have a modification 

ls / #Show the root directory.
ls /etc | head -20 #list to the directory /etc but with the pipeline filter the actions and show only the fisrt 20 lines with head.
ls /dev | head -20 #Same like the last one but in the /dev directory.
          tail #show the last 20 lines
          