#!/bin/bash

argcheck () {
    for arg in "$@"
do
  echo \'"$arg"\'
done
}
argcheck "$@"