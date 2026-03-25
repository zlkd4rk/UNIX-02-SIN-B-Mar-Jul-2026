ls #list of file and folders in the actual ubication
ls /dev 
ls /proc #List with the information about the process and the hardware, in the meomry RAM
cat /proc/cpuinfo #Show a detail information about the CPU.
ls /bin  #List of binary files.
type zsh #An executable in the binary folder.
ls /home #Where save the personal users folders.
ls /codespaces #Specific folder of cloud service (GitHub Codespace) where you save are your work.

gcc saludo.c -o saludo_bin #Call the ggc compiler to trnasform que main sorce of saludo.c to a executable binary file saludo_bin
cp saludo_bin /bin/saludo_bin #Try to copy the binary executable in the system commands folber (/bin)
sudo cp saludo_bin /bin/saludo_bin #To do it, need permission so if the last command dont work use sudo to execute the command like a root.
cd / #root, move you to the high livel od adminitrator. 
saludo_bin #execute the command, and print the messsage "Hola Mundo!", this message are the same in the print line in saludo.c
cd /home/codesapce #Chace directory to /home/codespaces.
saludo_bin #execute 

ls -i #List of files with each "inode" number (unique identificator of each file)
ls -f #List of files with non order. 
pwd #(Print wordl directory), print the directory where I am wornking
