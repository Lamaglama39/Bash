#!/bin/bash
##################################################################################
# Scrip tName  : diffmv.sh
# Discription  : After comparing the contents with diff, 
#                if the contents are identical, move them to the trash directory.
# How to : diffmv.sh $1 $2 ...
#     $1 : File name to be compared
#     $2 : File name to be compared
##################################################################################

diffmv () {
  tmp=/tmp/$$

  mkdir -p trash || exit 1
  ls "$@" > $tmp-list

  loopx $tmp-list $tmp-list |
  awk '$1<$2' |
  while read a b ; do
    diff "$a" "$b" && mv "$b" ./trash/
  done
  rm $tmp-list
}

diffmv "$@"