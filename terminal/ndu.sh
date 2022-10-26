#!/bin/bash
######################################################################
# Scrip tName  : ndu.sh
# Discription  : Outputs the capacity of the specified directory.
# How to : ndu.sh $1 $2 ...
#     $1 : directory name
#     $2 : directory name
######################################################################

for dir in "${@:-.}"; do
  if [ -e "$dir" ]; then
    result=$(du -s "$dir" | cut -f 1)
    let total=$result*1024

    echo -n "Total for $dir = $total bytes"
    if [ $total -ge 1073741824 ]; then
      echo  " ($((total/1073741824)) GB)"    
    elif [ $total -ge 1048576 ]; then
      echo  " ($((total/1048576)) MB)"
    elif [ $total -ge 1024 ]; then
      echo " ($((total/1024)) KB)"
    fi
  fi
done