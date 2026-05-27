id 
id -gn #Only the name of the principal group
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#the group is the main group of the user.

#See the current group
echo "Grupo actual: $(id -gn)"
#Create a file before the use of newgrp
touch ~/antes_de_newgrp.txt
ls -la ~/antes_de_newgrp.txt


newrgp desarrolladores
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ newgrp desarrolladores
#newgrp: group 'desarrolladores' does not exist

id -gn
echo "Nuevo grupo activo $(id -gn)"
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ echo "Nuevo grupo activo $(id -gn)"
#Nuevo grupo activo desarrolladores

#/workspaces/UNIX-02-SIN-B-Mar-Jul-2026 # groupadd desarrolladores
#/workspaces/UNIX-02-SIN-B-Mar-Jul-2026 # exit
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ id -gn
#vscode
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ echo "Nuevo grupo activo $(id -gn)"
#Nuevo grupo activo vscode
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ sudo adduser vscode desarrolladores
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ newgrp desarrolladores
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ echo "Nuevo grupo activo $(id -gn)"
#Nuevo grupo activo desarrolladores

#Create a new file in the subshell
touch ~/dentro_de_newgrp.txt
ls -la ~/dentro_de_newgrp.txt

#Now hte group is desarrolladores
#Create a directory
mkdir -p ~/proyecto_dev/src
ls -la ~/
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ ls -la ~/
#total 180
#drwxr-xr-x 1 vscode vscode           4096 May 27 13:30 .
#drwxr-xr-x 1 root   root             4096 May 18 14:31 ..
#-rw-r--r-- 1 vscode vscode           2114 May 18 14:31 .bashrc
#drwxr-xr-x 3 vscode vscode           4096 May 27 12:45 .cache
#drwxr-xr-x 1 vscode vscode           4096 May 27 12:45 .config
#drwxr-xr-x 3 vscode vscode           4096 May 27 12:45 .dotnet
#drwxr-xr-x 1 vscode vscode           4096 May 18 14:31 .oh-my-zsh
#drwxr-xr-x 5 vscode vscode           4096 May 27 12:45 .vscode-remote
#-rw-r--r-- 1 vscode vscode          36792 May 27 12:48 .zcompdump-codespaces-a47725-5.9
#-r--r--r-- 1 vscode vscode          84632 May 27 12:48 .zcompdump-codespaces-a47725-5.9.zwc
#-rw-r--r-- 1 vscode vscode             22 May 18 14:31 .zprofile
#-rw------- 1 vscode vscode            411 May 27 13:07 .zsh_history
#-rw-r--r-- 1 vscode vscode           4018 May 18 14:31 .zshrc
#-rw-r--r-- 1 vscode vscode              0 May 27 13:04 antes_de_newgrp.txt
#-rw-r--r-- 1 vscode desarrolladores     0 May 27 13:30 dentro_de_newgrp.txt
#drwxr-xr-x 3 vscode desarrolladores  4096 May 27 13:30 proyecto_dev
#-rw-r--r-- 1 vscode vscode              0 May 27 12:55 test_grupo_heredado.txt

#Exit of the subshell
exit
#Verify if you return to the original group
id -gn
echo "Grupo restaurado: $(id -gn)"

ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ ls -la ~/antes_de_newgrp.txt ~/dentro_de_newgrp.txt
#-rw-r--r-- 1 vscode vscode          0 May 27 13:04 /home/vscode/antes_de_newgrp.txt
#-rw-r--r-- 1 vscode desarrolladores 0 May 27 13:30 /home/vscode/dentro_de_newgrp.txt

echo "PID del shell actual : $$"
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ echo "PID del shell actual : $$"
#PID del shell actual : 11645
newgrp desarrolladores
echo "PID dentro de newgrp: $$" 
#@zlkd4rk ➜ /workspaces/UNIX-02-SIN-B-Mar-Jul-2026 (security2) $ echo "PID dentro de newgrp: $$" 
#PID dentro de newgrp: 27280