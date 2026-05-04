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