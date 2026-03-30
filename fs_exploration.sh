sudo apt update # This command synchronizes local package index files with their remote sources. Now the local system has an updated map of the dependency structure and versions available on the server, allowing it to calculate which packages are candidates for an upgrade
sudo apt upgrade ## Manage updates in the installed packages branch without altering the fundamental system structure.
sudo apt install parted #This command performs the retrieval, dependency resolution, and installation of a specific package and its necessary shared objects. 
#Parted (Partition Editor) is a library and command-line front-end designed for manipulating partition tables and storage structures on block devices.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e 
#&& only is the last command is true execute the next command (AND gate, logic multiplication).
#Used to determine if your computer booted using the modern UEFI interface or the legacy BIOS.
lsblk -f 
[ -d/sys/firmware/efi ] && echo "EUFI" || echo "BIOS"

echo "esto un archivo" > archivo.txt
stat archivo.txt
