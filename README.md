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

'sudo apt install -y git vim make gcc libncurses-dev flex bison bc cpio libelf-dev libssl-dev syslinux dosfstools qemu-system-x86'  //Install new commands, with the parameter -y to respond yes for every questions.  git: Use it to clone the source code of ptojects. Vim: Text editor direct in the terminal. make: Tool to automate the compilation of programs that read a file called Makefile. gcc: Compiler, essential to convert code into a executable binary. libncurses-dev: Library to create visual interfaces based in text. flex/bison: Lexical and syntactic analyzer generators bc:Calculator for the line of commands. cpio: Tool for archiving files  libelf-dev: Library for handling ELF files  libssl-dev: SSL/TLS security headers.

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
git clone --depth 1 https://github.com/torvalds/linux.git // 
cd linux //
make  menuconfig //
make -j 2 //

bzImage is ready - This indicate the kernel is ready. 


Step 4.- Compiling BusyBox
git clone --depth 1 https://git.busybox.net/busybox  
cd busybox
make menuconfig //Open a menu, navegate in to the menu 
make -j  2  //When you try to compile Busybox the terminal print an error so you use nano (text editor) to change the configuration 


