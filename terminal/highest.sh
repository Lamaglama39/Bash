#!/bin/bash

#highest filename [howmany]
#
#filenameファイルの内容を数字の大きい順に[howmany]行表示する。
#入力ファイルの各行は、数字で始まるものとする。
#[howmany]のデフォルト値は10

#filename=$1
#filename=${filename:?"messing."}
#howmany=$$
#${header:+"ALBUMS  ARTIST\n"}

#echo -e -n ${header:+"ALBUMS  ARTIST\n"}
#sort -nr $filename | head -${howmany:=10}

#if [ -z "$1" ]; then
#    echo 'usage: heighest filename [-N]'
#else
#    filename=$1
#    howmany=${2:-10}
#    sort -nr "$filename" | head -$howmany
#fi

# if [ -z "$1" ]; then
#     echo "usage: highest filename [-N]"
# fi

# filename=$1
# howmany=$2
# if [ -z $2 ]; then
#     howmany=10
# fi
# sort -nr "$filename" | head -n "$howmany"



if [ -n "$(echo $1 | grep '^-[0-9][0-9]*$')" ]; then
  howmany=$1
  shift
elif [ -n "$(echo $1 | grep '^-')" ]; then
  echo 'usage: highest [-N] filename'
  exit 1
else
  howmany="-10"
fi

filename=$1
sort -nr $filename | head $howmany