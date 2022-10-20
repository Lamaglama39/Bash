#!/bin/bash
#######################################################
# Scrip tName  : extract.sh
# Discription  : Extract the following compressed file.
#                *.tar.gz,*.tar.Z*.tar.bz2
# How to : extract.sh $1 $2
#     $1 : Filename
#     $2 : Destination path
#          Default is the current directory
#######################################################

dir=${2-$(pwd)}

case $1 in
  *.tar.gz|*.tar.Z)
    tar zxvf "$1" -C "$dir"
    ;;
  *.tar.bz2)
    tar jxvf  "$1" -C "$dir"
    ;;
  *)
    echo "$1"'Please specify a valid file name.' 1>&2
    exit 1
    ;;
esac