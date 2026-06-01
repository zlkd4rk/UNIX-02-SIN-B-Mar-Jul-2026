#!/bin/bash 
PUBLISHER="No Starch Press" #This varibale is public available in the entire script
print_name(){
      local name #This local varibale is only usable into the function 
      name="Black Hat Bash" 
      echo "${name} by ${PUBLISHER}" 
} 

print_name #To invoke the function only write the name, totally different like python that you need to type the function name and a ().

echo "Variable ${name} will not be printed because it is a local variable."

