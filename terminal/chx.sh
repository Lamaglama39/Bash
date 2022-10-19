#!/bin/bash

for file in *.sh
do
  if [ -z "$file" ]; then
    echo "ERROR: Please specify a file name.
         Usage: chx [filename]"
  fi

  if [ ! -e "$file" ]; then
    echo "ERROR: No such file.
         Usage: chx [filename]"
  elif [ -f "$file" ]; then
    chmod +x "$file"
    echo "SUCCESS: Execution authorization granted.
         $file is Can be executed as a command."
  elif [ -d "$file" ]; then
    echo "ERROR: $file is a directory, please specify file name.
         Usage: chx [filename]"
  else
    echo "ERROR: Failure: That is Not File.
         Please enter the correct file name."
  fi
done