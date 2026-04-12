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

