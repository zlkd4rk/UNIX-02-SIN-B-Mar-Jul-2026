El sistema que vamos a construir tiene tres componentes: 
1. **Kernel de Linux** - el núcleo del sistema operativo. 
2. **BusyBox** - proporciona las utilidades básicas de Unix (ls, pwd, vi, etc. ) en un solo binario.
3. **SysLinux** - el bootloader que carga todo al arrancar 

/* I forgot to do a commit in the wednesday class cuz I repeat the procees to compile the limux kernel and worried about the review of the project. Sorry. *

Step 1.- Create a CodeSpace
Create new repository in the branch boot, and clear the repository
Step 2.- Install dependencies
'sudo apt update' // Sudo (SuperUser), apt advanced package tool, and update for update the list of packages available in the repositories

'sudo apt upgrade' //Install the latest versions of all the packages you already have on your system.

'sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86'  //Install new commands, with the parameter -y to respond yes for every questions.  
git: Use it to clone the source code of ptojects. Vim: Text editor direct in the terminal. 
make: Tool to automate the compilation of programs that read a file called Makefile. 
gcc: Compiler, essential to convert code into a executable binary. libncurses-dev: Library to create visual interfaces based in text. flex/bison: Lexical and syntactic analyzer generators 
bc:Calculator for the line of commands. 
cpio: Tool for archiving files  
libelf-dev: Library for handling ELF files 
libssl-dev: SSL/TLS security headers.

What is each package for?
gcc, make - compilación del kernel y BusyBox
libncurses-dev - menús interactivos de configuración (menuconfig)
flex, bison, bc - requeridos por el proceso de build del kernel
cpio - para crear el initramfs
libelf-dev, libssl-dev - dependencias del kernel
syslinux - el bootloader
dosfstools - para crear el filesystem FAT
qemu-system-x86 - para probar la imagen sin necesidad de hardware real

Step 3.-Compiling the Linux kernel
git clone --depth 1 https://github.com/torvalds/linux.git // Copy the repository of Linux in Github; --depth 1, --depth 1 it's a trick to download the latest kernel version instead of downloading all the changes since 1991.
cd linux // Change direcory to the new folder and work with the main soruce
make  menuconfig // Mark 64-bit kernel --> exit --> save configuration
make -j 2 // Start converting the source code into a machine lenguaje. Only with 2 cores

bzImage is ready - This indicate the kernel is ready. 

sudo mkdir /boot-files //Create a directory called /boot-files
sudo cp arch/x86/boot/bzImage /boot-files/ //copy the kernel from his origin directory in the new directory
cd .. //Exit the directory


Step 4.- Compiling BusyBox
git clone --depth 1 https://git.busybox.net/busybox  //Like the kernel of Linux, download the last version of the source code of BusyBox
cd busybox 
make menuconfig //Open a menu, navegate in to the menu, settings --> Build Options --> mark Build static binary (no shared libs), this This avoids external library dependencies.
make -j  2   
//When you try to compile Busybox the terminal print a few errors so use nano (text editor) to change the configuration of .config, explore the file until you see CONFIG_TC=y and change the =y  to =n and compile again.

sudo mkdir /boot-files/initramfs //Create a directory into the directory /boot-files called /initramfs
sudo make CONFIG_PREFIX=/boot-files/initramfs install //Says to busybox to install it into specific direction, this appper in the directory /boot-files/initramfs folders like /bin, /sbin and /usr.

Step 5.- Create initramfs
cd /boot-files/initramfs // Go to the directory where you install BusyBox.
sudo vi init //Use the editor "vi" to create a important file.  Use the comands #!/bin/sh (The kernel must execute use the shell interpreter) and in the second line /bin/sh (open a terminal to write commands).
sudo rm linuxrc  //Busybox create a file called linuxrc so use rm(remove) to avoid a conflict with init file. 
sudo chmod +x init  //chmod +x make a text file get permission to execute.
sudo find . | cpio -o -H newc > ../init.cpio // list all List all current files and directorys. | (pipeline), cpio -o -H newc: take the list and transform it into a format for the linux kernel can understand. > ../init.cpio save all the compressed package in the superior direcory. 
cd ..  // Exit the directory 

Step 6.- Create the boot image
sudo su //Change to root for the next steps/commands 
dd if=/dev/zero of=boot bs=1M count=50 // dd is a tool to copy data of low level. Create an empty 50 MB file that will serve as a virtual disk.
mkfs -t fat boot //Make File System. Create a FAT file system in that file (required by Syslinux). 
syslinux boot // Install the necessary code in the boot sector of the boot file so that a computer knows that the disk "can be turned on"
/*Mount the image, copy the kernel and the initramfs*/
mkdir m //make a directory called m
mount boot m // It tricks the operating system into believing that the boot file is a USB drive inserted in the folder called m
cp bzImage init.cpio m // Copy the brain of the Operative System into a virtual disc.
umount m 

Step 7: Test with QEMU

qemu-system-x86_64 -nographic -append "console=ttyS0" -kernel bzImage -initrd init.cpio -drive file=boot,format=raw
//Emulate the program into a complete computer with 64 bits architecture. -nongraphic so QEMU dont pop up an another window and show all in the terminal. 

//If you do all the steps correctly you can use a terminal and try some commands like ls, pwd, vi and bc, and runs the commands perfectly. 


EXERCISES 
1.- Verify the firmware type: Run `[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS"` both in the Codespace and within QEMU. What result do you get and why? 

In both cases print BIOS beccause both environments are configured to emulate or present a legacy boot interface instead of a modern UEFI firmware interface. , in GitHub Codesapces are execute on Docker Containers, the containers dont have direct access of the firmware of the hardware; In QEMU, default configuration use a firmeware called SeaBIOS.
It is an open-source implementation of a traditional (Legacy) BIOS. SeaBIOS documentation. (n.d.). https://seabios.org/ 

2.-Inspect the structure: Within QEMU, run `ls /` and compare it to the directory structure we saw in class. Which directories are missing and why? 

Running `ls /` in a mini-distro has fewer elements than when used in the CodeSpace terminal. The amount of missing element is notorious.
The reason of missing directorys is because the mini-distro is not running in a Hard Disc, is running a initramfs (initial file system in RAM). This only show the binarys of BusyBox (bin and sbin) and the script init. Other reason is the kernel dont create the directorys like etc or var automatically, Since you are building the system "by hand", if you don't create the folder with (example: mkdir ), it won't exist.

3.-Exploring BusyBox: Within QEMU, run `ls -la /bin/` and observe that all the commands are symbolic links to the same binary. What advantage does this have for an embedded system?
In Codesapce (a traditional sustem), each command is a separate, large binary.In the mini-distro, they are all symbolic links  to the single executable called BusyBox. This combine everything into a single binary and share common code across all functions. Reduces the toal filesystem size. Also when you execute a command the operating system already has the BusyBox code loaded into the cache.

4.- Examine blocks: In the Codespace, create a file with `echo "hello" > test.txt` and then run `stat test.txt`. Identify the actual size versus the allocated blocks. Is there internal fragmentation?
The file size is 6 bytes: 5 for the word 'hello' and one additional byte for the newline character (\n) included by the echo command. The system has allocated 8 blocks, and since each block is 512 bytes, the total space occupied is 4,096 bytes(8x512) is a clear case of internal fragmentation. Even though the file only requires 6 bytes, the system must assign an entire IO block (4,096 bytes) to it. Consequently, 4,090 bytes are wasted, as this remaining space within the block cannot be used by any other file.

5.- Analyze partitions: Run `sudo parted -l && echo -e "\n---\n" && lsblk -f` on the codespace. This identifies which disks use GPT vs. MBR, and which filesystems are in use.
Pattitions
/dev/sda (size: 32.2GB) gpt //support more than 4 partitions
/dev/sdb (size: 48.3GB) msdos(MBR) // legacy 
/dev/sdc (Size: 550GB) gpt //Modern

/*Filesystems*/
ext4: The primary and most widely used file system in this environment located at: 
sda1 //Mounted in the root and system directory
sdb1 //Mounted in /tmp
sdc1 //Grand size partition, 500GB)