#!/bin/bash
###########################################################################
# Scrip tName  : pass.sh
# Discription  : Outputs users corresponding to the specified user ID.
# How to : pass.sh $1 $2 ...
#     $1 : User ID
#     $2 : User ID
###########################################################################

for i in $( cut -f 1,3 -d: /etc/passwd ) ; do
  array[${i#*:}]=${i%:*}
done


for id in "$@"; do
  if [[ `cut -f 3 -d: /etc/passwd | grep $id` ]]; then
    echo "User ID $id is ${array[$id]}."
  else
    echo "ERROR: ID $id "'does not exist.'
  fi
done

echo "There are currently ${#array[@]} user accounts on the system."