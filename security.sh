id # With that you can see the identification of the user(Numeric ID), primary group and also the secundary groups.
cat /etc/passwd | head -10 #See al the user of the system, but with the pipeline only see the first 10 users.

#Crypt Installation 
apt update
apt install python3-venv python3-pip python3-dev libcrypt-dev build-essential -y
python3 -m venv .venv
source .venv/bin/activate
python -m pip install crypt-r
python salt.py

#Salt 1: $6$ziEXgG2cs9Cr1MTU
#Hash 1: $6$ziEXgG2cs9Cr1MTU$907rhfqyvOKKw1kQhkzYCSROHXmeSE

#Salt 2: $6$alqOf6aAmR2X51Hy
#Hash 2: $6$alqOf6aAmR2X51Hy$N8EdeMwYtd3Qgfyk9DrGXHYXPn1g65

#¿Son iguales? False
                              
cat /etc/group | head -10 #See the content of the groups in the etc directory only the first ten groups.
groups #See what group the user below the user
groups $USER #See the /etc/group, with the environment variable to see which group the user belows. 

id -u # User ID
id -g # Grupo ID principal
id -G # 

cat  /etc/group | grep codespace #In the actual configuration the codespaes gruops dont exist so the commands print a error
#If you want to see the command run write a valid name before grep.

cat /etc/gshadow #System groups required for Linux to work

mkdir ~/proyecto_unix/ #Create a directory in the location ~/proyecto_unix/
ls -la ~/proyecto_unix/ #See the user (root) and in the group (root).

#groupadd [options] group_name
#Create a simple group
sudo groupadd desarrolladores
sudo groupadd -g 2000 operaciones #GID especifico
#When the GId is less than 1000 is system gruop (GID>1000)
sudo groupadd --system servicios_web

#Verify the creations of the groups
grep "desarrolladores\|operaciones\|servicios_web" /etc/group
desarrolladores:x:1000:
operaciones:x:2000:
servicios_web:x:995:

grep -E "desarrolladores|operaciones|servicios_web" /etc/group
desarrolladores:x:1000:
operaciones:x:2000:
servicios_web:x:995:

#See principal options
groupadd --help


#See the range of the GIDs in the system
grep "GID_MIN\|GID_MAX\|SYS_GID" /etc/login.defs
#The system group have less GID than user minimun.
GID_MIN                  1000
GID_MAX                 60000
#SYS_GID_MIN              101
#SYS_GID_MAX              999
SUB_GID_MIN                100000
SUB_GID_MAX             600100000


#addgroup [options] group_name
addgroup diseno
addgroup --gid 2100 marketing
addgroup --system cache_web
grep "diseno\|marketing\|cache_web" /etc/group
diseno:x:1001:
marketing:x:2100:
cache_web:x:102:

groups
id
#Add the user in a group with usermod (bajo nivel)
usermod -aG desarrolladores root
usermod -aG diseno root
id root


# -a (append)
#This add the gropups instead of rewrite it

#Verify the changes in etc/group
grep "desarrolladores" /etc/group
desarrolladores:x:1000:root
grep "diseno" /etc/group
diseno:x:1001:root
grep "desarrolladores\|diseno" /etc/group

adduser root marketing
#See the curreng status
id root
grep root /etc/group
root:x:0:
desarrolladores:x:1000:root
diseno:x:1001:root
marketing:x:2100:root

#Create a temporal group
groupadd grupo_temporal 
usermod -aG grupo_temporal root
id root
usermod -G desarrolladores root 
id root

#Restore
usermod -aG diseno,marketing,grupo_temporal root
id root
uid=0(root) gid=0(root) grupos=0(root),1000(desarrolladores),1001(diseno),2100(marketing),2101(grupo_temporal)

mkdir -p ~/lab_chgrp/{proyectos,reportes,scripts}
touch ~/lab_chgrp/proyectos/app.py
touch ~/lab_chgrp/proyectos/config.json
touch ~/lab_chgrp/reportes/informe.txt
touch ~/lab_chgrp/scripts/deploy.sh

ls -la ~/lab_chgrp/proyectos/
total 8
drwxr-xr-x 2 root root 4096 may  6 13:29 .
drwxr-xr-x 5 root root 4096 may  6 13:27 ..
-rw-r--r-- 1 root root    0 may  6 13:28 app.py
-rw-r--r-- 1 root root    0 may  6 13:29 config.json

ls -la ~/lab_chgrp/reportes/ 
total 8
drwxr-xr-x 2 root root 4096 may  6 13:30 .
drwxr-xr-x 5 root root 4096 may  6 13:27 ..
-rw-r--r-- 1 root root    0 may  6 13:30 informe.txt