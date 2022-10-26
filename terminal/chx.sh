#!/bin/bash
######################################################################
# Scrip tName  : chx.sh
# Discription  : For files with the specified extension sh
#                Add execution rights.
# How to : chx.sh $1 $2 ...
#     $1 : filename
#     $2 : filename
######################################################################

Usage='Usage: chx [filename]'

for file in "$@"
do
  if [ -z "$file" ]; then
    echo "ERROR: Please specify a file name.
        $Usage"
  fi

  if [ ! -e "$file" ]; then
    echo "ERROR: No such file.
       $Usage"
  elif [ -f "$file" ]; then
    chmod +x "$file"
    echo "SUCCESS: Execution authorization granted.
         $file is Can be executed as a command."
  elif [ -d "$file" ]; then
    echo "ERROR: $file is a directory, please specify file name.
        $Usage"
  else
    echo "ERROR: Failure: That is Not File.
        $Usage"
  fi
done