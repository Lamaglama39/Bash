#!/bin/bash
#################################################################
# Scrip tName  : encode.sh
# Discription  : URL encoding of the content of the passed file.
# How to : cat $filename | encode.sh
#################################################################
set -euo pipefail

url_encode() {
  while read -r line
  do
    echo "$line" |
      nkf -W8MQ |
      sed 's/=$//' |
      tr '=' '%' |
      paste -s -d '\0' - |
      sed -e 's/%7E/~/g' \
          -e 's/%5F/_/g' \
          -e 's/%2D/-/g' \
          -e 's/%2E/./g'
  done
}

url_encode