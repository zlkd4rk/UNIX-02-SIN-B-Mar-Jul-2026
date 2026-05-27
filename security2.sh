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