#!/bin/bash
######################################################################
# Scrip tName  : recls.sh
# Discription  : Displays the arguments and, 
#                in the case of directory, the internal files.
# How to : recls.sh $1 $2 ...
#     $1 : Name of executable file you want to create.
#     $2 : Name of executable file you want to create.
######################################################################

recls(){
    for tryfile in "$@"; do
      echo "$tryfile"
      if [ -d "$tryfile" ]; then
        thisfile=$tryfile
        command ls "$thisfile"
      fi
    done
}
recls "$@"