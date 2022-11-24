#!/bin/bash
################################################################################
# Scrip tName  : password.sh
# Discription  : Outputs the password with the specified number of characters.
# How to : password.sh [ -i||-s||-m ] [ -c int ] [ -o int ]
#     -i : integer
#     -s : string
#     -m : integer and string
#     -c : characters number
#     -o : outputs number
################################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts ismc:o: option
do
  case $option in
    i)
      word=int;;
    s)
      word=str;;
    m)
      word=mix;;
    c)
      characters_num=$OPTARG;;
    o)
      outputs_num=$OPTARG;;
    \?)
      echo "Usage: $0 [-a] [-l] [-n number] " 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Outputs the password with the specified number of characters.'
fi

case $word in
    int)
        #int password
        cat /dev/urandom | tr -dc '0-9' | fold -b"${characters_num:-10}" | head -n "${outputs_num:-10}"
        ;;
    str)
        #str password
        cat /dev/urandom | tr -dc 'a-zA-Z' | fold -b"${characters_num:-10}" | head -n "${outputs_num:-10}"
        ;;
    mix)
        #mix password
        cat /dev/urandom | base64 | fold -b"${characters_num:-10}" | head -n "${outputs_num:-10}"
        ;;
esac