#!/bin/bash
#######################################################
# Scrip tName  : compress.sh
# Discription  : Compress the file to the following format.
#                *.tar.gz,*.tar.Z*.tar.bz2
# How to : compress.sh $1 $2 $3
#     $1 : Filename
#     $2 : Compression format
#          Default is *.tar.gz format
#     $3 : Destination path
#          Default is the current directory
#######################################################

dir="$3/"

case $2 in
  gz|Z)
    if [ -z "$3" ];then
      tar cvzf "$1.tar.gz" "$1"
    else
      tar cvzf "$dir$1.tar.gz" "$1"
    fi
    ;;
  bz2)
    if [ -z "$3" ];then
      tar cjvf  "$1.tar.bz2" "$1"
    else
      tar cjvf  "$dir$1.tar.bz2" "$1"
    fi
    ;;
  *)
    echo "$1:" 'Please specify a valid file name.' 1>&2
    exit 1
    ;;
esac