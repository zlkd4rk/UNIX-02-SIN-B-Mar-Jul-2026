uname -a
which gpg 
gpg --version
#RSA 4096, universal y compatible 
gpg --full-generate-key
gpg --list-keys
gpg --armor --export boldstepandrex648@gmail.com > mi_llave_publica.asc #export my public keys 
ls 
cat mi_llave_publica.asc
gpg -list-secret-keys --keyid-format=long  #list about private keys 
gpg --armor --export-secret-key 9CE2A432BF706712 # we can use it to list our pair of keys and can execute:
gpg -armor --export-secret-keys # 
gpg --armor --export boldstepandrex648@gmail.com > mi_llave_publica.asc #repeat the process to create a file with the public key
