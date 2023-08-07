#!/bin/bash
######################################################################
# Scrip tName  : factorial.sh
# Discription  : Outputs the factorial of the specified integer.
# How to : factorial.sh $1 $2 ...
#     $1 : Any integer.
#     $2 : Any integer.
######################################################################

factorial () {

  fact () {
  if [[ "$1" -le 1 ]]; then
    echo 1
    return
  fi
  n="$(($1 - 1))"
  n="$(fact "$n")"
  echo "$((n * $1))"
  }

  for num in "$@"
  do
   echo -ne "$num"'! = '
   fact "$num"
  done
}
factorial "$@"