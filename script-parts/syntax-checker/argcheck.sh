#!/bin/bash
##############################################################
# Scrip tName  : argcheck.sh
# Discription  : Displays the specified arguments as they are.
# How to : argcheck.sh $1 $2 ...
#     $1 : Argument of something
#     $2 : Argument of something
##############################################################

argcheck () {
    for arg in "$@"
do
  echo \'"$arg"\'
done
}
argcheck "$@"