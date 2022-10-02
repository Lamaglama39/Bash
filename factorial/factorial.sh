#!/bin/bash

factorial () {
  if [ "$1" -le 1 ]; then
    echo 1
    return
  fi
  n=$(expr "$1" - 1)
  n=$(factorial "$n")
  expr "$n" \* "$1"
}
factorial "$1"