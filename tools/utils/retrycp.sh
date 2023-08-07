#!/bin/bash
############################################################################
# Scrip tName  : retrycp.sh
# Discription  : If copying fails, 
#                copying is performed again after a certain period of time.
# How to : retrycp.sh $1 $2
#     $1 : original file
#     $2 : File after copy
############################################################################

until cp "$1" "$2" 2> /dev/null; do
  echo -n 'Failed to copy files, will rerun in 5 seconds'
  for time in {0..5}
  do
    if [[ $time -eq 5 ]]; then
      echo "."
      sleep 1
    else
      sleep 1
      echo -n "."
    fi
  done
done