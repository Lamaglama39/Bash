#!/bin/bash
######################################################################
# Scrip tName  : 9x9.sh
# Discription  : Displays the multiplication table , line by line.
#                That's all there is to it.....
# How to : 9x9.sh
######################################################################

9x9 ()
{
  for (( i=1; i <= 9; i++ ))
  do
    for (( j=1; j <= 9; j++ ))
    do
      echo -ne "$(( j * i ))\t"
    done

    echo
  done
}

9x9