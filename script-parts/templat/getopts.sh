#!/bin/bash

while getopts cvi:o: option
do
  case $option in
    c)
      echo '-cオプションが指定されました';;
    v)
      echo '-vオプションが指定されました';;
    i)
      echo '-iオプションで'"$OPTARG"'指定されました';;
    o)
      echo '-oオプションで'"$OPTARG"'指定されました';;
    \?)
      echo "Usage: $0 [-c] [-v] [-i file] [-o file] [args...]" 1 >&2
      
      exit 1;;
  esac
done
shift `expr "$OPTIND" - 1`
if [ $# -ge 1 ]; then
  echo 'オプション以外の引数は'"$*"'です'
else
  echo 'オプション以外の引数はありません'
fi