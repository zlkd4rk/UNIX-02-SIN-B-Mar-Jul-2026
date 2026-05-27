id 
id -gn #Only the name of the principal group
#Create a file and see which group inherits
touch ~/test_grupo_heredado.txt
ls -la ~/test_grupo_heredado.txt
#the group is the main group of the user.
