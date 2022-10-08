#!/bin/bash

while
 read -p \
'1) up
2) down
3) left
4) right
5) look
6) quit
コマンド? ' cmd
do
  case $cmd in
    1)
      echo 'Moved up.';;
    2)
      echo 'Moved down.';;
    3)
      echo 'Moved left.';;
    4)
      echo 'Moved right.';;
    5)
      echo 'Picked up an item.';;
    6)
      echo 'exit.'
      break;;
    *)
      echo "$cmd"'というコマンドはありません';;
  esac
  echo
done