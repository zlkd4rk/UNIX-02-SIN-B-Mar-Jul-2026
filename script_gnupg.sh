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

#Block C
echo "tengo mucho sueño,:V" > doc_no_cifrado.txt #create a file with the secret message. this message must be encrypted.
#echo: we can use it to show something into the terminal
#> : filter to .txt
gpg --output holaarieltilin.txt --encrypt --recipient 042DA1A9783F14852956063570571C1279AE9727 doc_no_cifrado.txt 
#create a new file with the name you prefer, this use the last file named "doc_no_cifrado.txt" wiht the original message,
#when you create this file and open it, show a lot of characters, this characters at simple view humans dont undertands.
#This file sahre it to your partner and both decrypt themessage.
gpg --decrypt Holaandrestilinjaja.txt #This command decrypt the message
#When you try to execute the command to decrypt the message show a rectangular, you need to put your password/safe word to complete the decrypt 
#In that case my partner send a greet ("Hola Aandres") 
#The message appear in the terminal and all the information about my key.



gpg --armor --export-secret-key 9CE2A432BF706712 # we can use it to list our pair of keys and can execute:
gpg -armor --export-secret-keys # 



#Block D
gpg --output doc_no_cifrado_firmado.txt --clearsign doc_no_cifrado.txt # Genrate a digital sign, so this make possible to the other person read the message and include a BGP sign to prove the authenticity.
gpg --output doc_no_cifrado_binario.txt --sign doc_no_cifrado.txt #Generate a new file with the sign, the diffrence is in bynary so most of the text/characters are no readable. 
gpg --output doc_no_cifrado_firma_separada.sig --detach-sign doc_no_cifrado.txt #This create a file only with the sign ignoring the secret message 
gpg --verify docfirmadoariel.txt 
#First, verify the signed file. A message will pop up saying 'Good signature', which indicates the signature is valid. However, you will see a warning stating the key is not certified, meaning there is no proof that the signature actually belongs to the owner
gpg --verify docfirmadobinarioari.txt
#Second, we must verify the binary sign file with unreadable characters, show the same message like the previously file. 
gpg --verify docfirmaseparadaari.sig doc_no_cifradoariel.txt
#And the final file, the only contain the sign in a .sig file, with my partner use Gemini for help because at the moment to execute the command show a error with the hash and no data found
#so, Gemini says enter the standard command and, at the end, add the name of the original file sent by your partner
#this show the same message for the good signature. 




gpg --edit-key 