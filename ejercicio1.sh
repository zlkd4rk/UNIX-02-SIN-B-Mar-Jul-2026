echo '#!/bin/sh'> hola.sh #Create a new file called hola.sh and write in it "#!/bin/sh".
cat hola.sh
echo 'echo "Hola desde mi primer script"' >> hola.sh #This print the second echo as string into hola.sh
echo ' "Hola desde mi primer script"' >> hola.sh #Delete the second echo and print only the text after it. 
cat hola.sh
./hola.sh

ls -l hola.sh #see the permission of the file hola.sh
chmod +x hola.sh #Chage the mode og the file and give the permission of execute (+x).
ls -l hola.sh #See again to comprobate the permission of the file.
./hola.sh #Execute the script

ls /etc
sudo touch /etc/prueba.txt #Use sudo cuz /etc is a protected direcotyr and you want to touch a file in it.
mkdir ~/mi_carpeta
sudo apt install install cowsay #Sudo is used to install packages.





