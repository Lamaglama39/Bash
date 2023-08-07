#!/bin/bash

#selectの基本構文
PS3='Please select a command.'
select cmd in up down left right look quit
do
  case $cmd in
    up)
      echo 'Moved up.';;
    down)
      echo 'Moved down.';;
    left)
      echo 'Moved left.';;
    right)
      echo 'Moved right.';;
    look)
      echo 'Picked up an item.';;
    quit)
      echo 'exit.'
      break;;
    *)
      echo "There is no command called $REPLY.";;

  esac
  echo
done