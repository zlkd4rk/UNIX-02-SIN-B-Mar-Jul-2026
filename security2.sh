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
