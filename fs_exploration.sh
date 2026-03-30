sudo apt update # This command synchronizes local package index files with their remote sources. Now the local system has an updated map of the dependency structure and versions available on the server, allowing it to calculate which packages are candidates for an upgrade
sudo apt upgrade ## Manage updates in the installed packages branch without altering the fundamental system structure.
sudo apt install parted #This command performs the retrieval, dependency resolution, and installation of a specific package and its necessary shared objects.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e 
#&& only is the last command is true execute the next command (AND gate, logic multiplication)

[ -d/sys/firmware/efi ] && echo "EUFI" || echo "BIOS"

