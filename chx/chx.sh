#!/bin/bash
filename=$1

chx () {

#Check if the file name is listed
  if [ -z "$filename" ]; then
    echo "Please specify the file name."
    echo "Usage: chx [filename]"
  return "8"
  fi

#Check if the target is a file
  if [ ! -e "$filename" ]; then
    echo "Failure: File does not exist."
    echo "Please enter the correct file name."
  elif [ -f "$filename" ]; then
    chmod +x "$filename"
    echo "SUCCESS: That is ShellScript."
    echo "It can be executed as a command."
  elif [ -d "$filename" ]; then
    echo "Failure: That is Not directory."
    echo "Please enter the correct file name."
  else
    echo "Failure: That is Not File."
    echo "Please enter the correct file name."
  fi
}

#Run command
chx