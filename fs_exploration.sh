sudo apt update # This command synchronizes local package index files with their remote sources. Now the local system has an updated map of the dependency structure and versions available on the server, allowing it to calculate which packages are candidates for an upgrade
sudo apt upgrade ## Manage updates in the installed packages branch without altering the fundamental system structure.
sudo apt install parted #This command performs the retrieval, dependency resolution, and installation of a specific package and its necessary shared objects. 
#Parted (Partition Editor) is a library and command-line front-end designed for manipulating partition tables and storage structures on block devices.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e 
#&& only is the last command is true execute the next command (AND gate, logic multiplication).
#Parted is a editor for partitions inGNU and -l show the list of all que poartitions in the device.
#echo -e "\n---\n" just print a line (---) to separate the content printend by parted and lsblk
#lsblk Show the devices for an a block in a three-like format. 
[ -d/sys/firmware/efi ] && echo "EUFI" || echo "BIOS" #Used to determine if your computer booted using the modern UEFI interface or the legacy BIOS.

echo "esto un archivo" > archivo.txt
#In a txt file save the message "esto es un archivo", and use echo to print in to the terminal, > use it to save the message into a txt file.
stat archivo.txt
#This use to see all the inforamtion about this file, like the inode of the file, metadada like date of modification, the size of the file and the amount of the blocks the file use.