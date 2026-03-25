#Block A - envairoment preparation 
#With these 3 commands I can see the information of the environment in which I am going to work
uname -a #This works like a identification document with -a (all]) shows all the information that the command can show 
which gpg #Shows the location of a executable program 
gpg --version #Show all the information about gpg like libraries, version,where the files are saved.
gpg --full-generate-key #Use it to create a key, and create a single one or a pair of it.
gpg --list-keys #Shows a list of keys, includes own keys and information like the hash, date of expiration.and more.
gpg --list-secret-keys --keyid-format=long  #Show the private keys (sec), and relevant information 

#Block B
gpg --armor --export boldstepandrex648@gmail.com > mi_llave_publica_new.asc #export my public keys 
#this create a file with the name "mi_llave_publica_new.asc", with the extension.asc make yhis file readable for the human eyes. 
gpg --import Ariel_public_key.asc #Use this command to export the key. 
#If you want to sent a encrypted message you need to add your partner public key, so with this command you export hes key.
#You must export the file directly to your codespace and import it, if you donde correctly you can comprobate this using --lsit-keys 
ls #extra command to see all the files in the machine and see the file with the key create correctly
cat mi_llave_publica_new.asc #another extra command to see the file into the terminal
gpg --list-keys #this commands show again, but you can see your public key and your partner public key, with all the essential information. 


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

gpg --output holaarieltilin.txt --encrypt --recipient 042DA1A9783F14852956063570571C1279AE9727 doc_no_cifrado.txt 
#create a new file with the new you prefer, this use the last file named "doc_no_cifrado.txt" wiht the original message,
#when you create this file and open it, show a lot of characters, this characters the humans dont undertands. 

#we need to known the message so we can use this command to decrypt the massage.
gpg --decrypt Holaandrestilinjaja.txt 
#this decrypt the message, before I save hes public key, soy watch this massage is easy, i guess.
#he send me a message with the text "hola andres"
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt 

#with the file sign use 
gpg --verify xxxxxxxxxxxx.txt

gpg --edit-key 