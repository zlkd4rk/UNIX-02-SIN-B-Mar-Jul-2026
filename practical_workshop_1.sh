uname -a
which gpg 
gpg --version
#empieza con punto empieza es un archivo oculto.
#RSA 4096, universal y compatible 
gpg --full-generate-key
gpg --list-keys
gpg --armor --export boldstepandrex648@gmail.com > mi_llave_publica.asc