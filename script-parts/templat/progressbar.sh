#!/bin/bash
#######################################################
# Scrip tName  : progressbar.sh
# Discription  : progress bar can be implemented.
#                Embed in function or 
#                call during function execution.
#                Please refer to the demonstration.
# How to : progressbar.sh $1
#     $1 : rate of achievement(int)
#######################################################

ECHO='echo -e'
case "$($ECHO)" in
 -e)
   ECHO="$(echo)";;
esac

print_bar () {
  percent=$1

  column="$(expr 50 \* "$percent" / 100)"
  nspace="$(expr 50 - "$column")"

  bar='\r['
  set dummy
  while [ $# -le "$column" ]
  do
    bar=$bar'='
    set - "$@" dummy
  done
  bar=$bar'>'

  set dummy
  while [ $# -le "$nspace" ]
  do
    bar=$bar' '
    set - "$@" dummy
  done
  bar=$bar'] '$percent'%\c'

  $ECHO "$bar"
  if [ "$percent" -eq 100 ]; then
    $ECHO "\n<<Process is complete>>"
  fi
}



demonstration () {
i=0
while [ "$i" -le 100 ]
do
  print_bar "$i"
  i="$(expr "$i" + 1)"

  num=("0.01" "0.05" "0.1" "0.25")
  sleep "${num[$((RANDOM % ${#num[*]}))]}"
done
echo
}
demonstration