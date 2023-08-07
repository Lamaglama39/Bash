#!/bin/bash
###################################################################
# Scrip tName  : image_bash.sh
# Discription  : Converts jpg files in the directory to any size.
# How to : image_bash.sh $1 $2
#     $1 : resize ratio
#          default 50%
#     $2 : directory path after resizing
#          default　current directory
#     $3 : file name after resizing
#          default filename50%.jpg
###################################################################

for afile in $(ls *.jpg);do
  resize=${1-'50%'}
  todir=${2-"$(pwd)"}
  tofile=${3-"$afile"'50%.jpg'}
  todir_tofile="$todir/$tofile"

  echo $afile 'to' $tofile
  convert -resize 50% "$afile" "$todir_tofile"
done