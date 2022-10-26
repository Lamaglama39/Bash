#!/bin/bash
##########################################################################
# Scrip tName  : highest.sh
# Discription  : Displays the contents of the specified file on $2 lines,
#                starting with the highest number.
# How to : highest.sh $1 $2 ...
#     $1 : filename
#     $2 : number of lines
##########################################################################

if [ -n "$(echo $2 | grep '[0-9][0-9]*$')" ]; then
  howmany='-'$2
elif [ -n "$(echo $2 | grep '^-')" ]; then
  echo 'usage: highest [-N] filename'
  exit 1
else
  howmany="-10"
fi

filename=$1
sort -n "$filename" | head "$howmany"