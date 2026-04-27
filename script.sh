Structure of linux command

command -> subcommand ->options->arguments 


ls -a #List showing all the files (Use it if you want to write fast)
ls --all #Same commmand but with the extende option (--all = -a) {Use it if you dont sure dont know what the reduced command do}
#In Linux we have commands with the short or large option. 

ls -l #List files in long format (detailed information with permissions, size, date, etc.)
ls -h #Print file sizes in human-readable format (KB, MB, GB instead of bytes)
ls -l -a -h #Combination of three options: long format, show all files (including hidden), and human-readable sizes.
ls -l -ah #Combination of two options in one option.
ls -lah #The same as (-l -ah), but combine all the options in one option for the command ls.

mkdir -rf . #Cannot create a direcory named -rf cuz the command mkdir read the options -rf as options instead of a directory name. To create a directory named "-rf", you need to use the double dash "--" to indicate the end of options.
mkdir -- -rf 
rm -rf #This command is used to remove files or directories, with the options -r (recursive) and -f (force). This combination is valid for the rm command and will forcefully remove files or directories without prompting for confirmation.
rm -- -rf #This command is used to remove a file named "-rf". The double dash (--) is used to indicate the end of options, allowing you to specify a file name that starts with a hyphen (-) without it being interpreted as an option.
rmdir -- -rf #This command is used to remove a directory named "-rf". The double dash (--) is used to indicate the end of options, allowing you to specify a directory name that starts with a hyphen (-) without it being interpreted as an option.

git clone --depth 1 https://github.com/torvalds/linux.git 
#git clone for clone the GitHub repository, --depth 1 for shallow clone (only the lastest commit), and the URL of the reposity to be cloned. This command will create a local copy of the Linux repository on your machine (Instead of cloning the entire history of the repository).
ls --help #See the help information for the ls command, including a list of available options and their descriptions.
man ls #See the manual page for the ls command, which provides detailed information about its usage, options, and examples.

man git-clone #In the manual of git-clone use / and write depth to search for the option --depth in the manual page.
#Clones a repository into a newly created directory, creates remote-tracking branches for each branch in the cloned repository (visible using git branch --remotes),
and creates and checks out an initial branch that is forked from the cloned repository’s currently active branch.
- rwx r-x r-- # Permission for user, group, and others (read, write, execute)

chmod #Change mode, who, operator, permission, file
chmod +x script.sh #Add execute permission for all users (user, group, and others) on the file script.sh
chmod u+x script.sh #Add execute permission for the user (owner) of the file script.sh
chmod o-r script.sh #Remove read permission for others (users who are not the owner or in the group) on the file script.sh
chmod u+rw,go-rwx script.sh #Add read and write permissions for the user (owner) of the file script.sh, and remove all permissions for group and others on the file script.sh

sudo chmod +x init 

sudo #Substitute user do, allows you to run commands with elevated privileges.
sudo echo "hola" > /etc/archivo_protegido #Only the echo command is run with elevated privileges, but the second part of the command line (redirection) dont execute with the sudo (elevated privileges).

tee #Its a command that reads from standard input and writes to standard output and files. 
echo "hola" | sudo tee /etc/archivo_protegido > /dev/null #Create the file but dont print the output in the terminal, because the output of the tee command is redirected to /dev/null.
echo "hola" | sudo tee /etc/archivo_protegido  #Print in the terminal "hola" and write "hola" to the file /etc/archivo_protegido with elevated privileges.

sudo sh -c 'echo "chao" >> /etc/archivo_protegido'
#sudo: executa something like root
#sh: open a shell  
#-c says to the shell, all in the simple quotes intepreted this shell root.
cat /etc/archivo_protegido

#When something implicate redirections, pipes and complex commands, use simple coutes to ensure that the entire command is executed with elevated privileges.

sudo su - #Log in as root user, its more aceptable to use sudo su or sudo -i, provides a login shell with the environment of the root user. 

echo "$HOME" #Print the directory path of current user home directory.
echo '$HOME' #With simple quotes, the variable $HOME is not expanded and treated as a string, and the terminal print $HOME.



boot-exploration (27-04-2026)
umask --> 0022 #When yo create a file/directory you can subtract permission 725 - 705 --> 020
touch archivo1 #Try to touch the file if the file dosent exist crete this file
mkdir directorio1 #Create a directory
ls-l #List of the files and directorys in long format
#Search the problem un the browser and you can find the solution for this problem
https://github.com/orgs/community/discussions/26026 
sudo apt-get update
sudo apt-get upgrade #Missing step
sudo apt-get install acl
sudo chown -R $(whoami) .
sudo setfacl -bnR .

umask 077 #Change the permission with umask 
touch secreto.txt #Create a new file but when you crete the file this are created with the 077 permission 677-077 = 700
mkdir privado #Same as the last one 777-077 = 700
ls -l #List all the files 
-rw------- 1 codespace codespace     0 Apr 27 12:59 secreto.txt
drwx------ 2 codespace codespace  4096 Apr 27 12:59 privado

chown #Change the owner. Usually only the root can change it
chgrp #Change group 

whoami
echo "Hola" > mi_archivo #Create a file with the text/message "Hola"
ls -l mi_archivo #List only this file in long format

sudo useradd -m -s /usr/bin/zsh luna #Add new user with a home directory and define the shell lune is about to use
sudo chown luna mi_archivo #Change the user luna instead of Codespaces
ls -l mi_archivo

groups #See the groups 
newgrp grupo_test #Crete a new group called grupo_test 
groupadd grupo_test #Add the group
groups #See all the groups again
touch comun #Create a file called comun
ls -l comun #List the file


sudo chown luna:grupo_test mi_archivo #Change the owner to luna and in the group create a file mi_archivo
ls -l mi_archivo #list the file
-rw-r--r-- 1 luna grupo_test 5 Apr 27 13:12 mi_archivo
#Use this if the command needs a passwrod
sudo usermod -aG grupo_test $USER
#Estructure
chown usuario:grupo fichero

mkdir -p proyecto/sub #Create a directory in proyecto and other folder in sub
touch proyecto/readme proyecto/sub/datos #Use touch to create a readme in proyecto and other in /sub/datos
sudo chown -R luna:grupo_test proyecto #Change the user in recursive to luna for the new grpuo grupo_test in proyecto
ls -lR proyecto #Use ls to see the list with a long format with Recursive reading