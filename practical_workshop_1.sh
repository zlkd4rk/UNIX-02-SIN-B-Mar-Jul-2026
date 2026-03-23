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
#With this public key, we need to send it to my friend, in codespaces create a file or copy the file into de machine, so we need to export this file/key to save it
gpg --import Ariel_public_key.asc #Use this command to export the key. 
#if it done correctly we can use gpg --list-keys and this show my personal public key(hash) and the other key of my partner.
gpg --list-keys #this shows m key and my friend key  

echo "tengo mucho sueño,:V" > doc_no_cifrado.txt #create a file to we need to encryprt with a "secret" message

#echo: we can use it to show something into the terminal
#> : filter to .txt


