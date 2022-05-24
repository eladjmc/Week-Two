#!/bin/bash

#Const that hold colors we need to display in some outputs
RED='\033[0;31m' #Color red
GREEN='\033[0;32m' #Color green
NC='\033[0m' # No Color

#Insert the first argument to variable 'password'.
password=$1 

#Const that hold the minimum amount of chars expected for the password.
MIN_PASSWORD_LENGTH=10
#Const that hold the length of an empty password(0)
NO_PASSWORD_LENGTH=0

#Check if user inputed an option - the only valid option for this script is -f
while getopts "f" arg; do
  case $arg in
    f)        #Case option -f was typed
      path=$2 #Put the file path string(the 2nd argument) into variable 'path'
      password=$(<$path) #insert the content of the file in the path of the 2nd argument into the 'password' variable
      ;;
    *)        #Case invalid option was typed
      echo -e ${RED}$1 is not a valid option.${NC} #display error message
      exit 1 #exit with an error
      ;;    
  esac
done

#Extract the length of the password string
passLength=${#password}


if [ "$passLength" -eq "$NO_PASSWORD_LENGTH" ]
then
     echo -e ${RED}Password was not added${NC} #display error message
     exit 1 #exit with an error
fi

#Check if the length is too short if so then break and error message
if [ "$MIN_PASSWORD_LENGTH" -gt "$passLength" ] 
then 
    echo -e ${RED}The password is too short.${NC} #display error message
    exit 1 #exit with an error
fi

#checks if password contains digits, capital letters lowercase letters with regular expressions (0-9),(a-z),(A-Z)
if ! [[ ($password =~ [[:digit:]]) && ($password =~ [[:lower:]]) && ($password =~ [[:upper:]]) ]]
then
    echo -e ${RED}The password does not contain a mix of digits + upper-case and lower-case letters.${NC} #display error message
    exit 1 #exit with an error
fi

echo -e ${GREEN}Password is VALID!${NC}
exit 0 #exit with no errors
