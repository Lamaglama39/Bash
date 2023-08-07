#!/bin/bash
#######################################################
# Scrip tName  : sjis_euc.sh
# Discription  : Converts a file with a specified
#                extension to a specified character set.
# How to : sjis_euc.sh $1 $2 $3
#     $1 : File extensions
#     $2 : Character code after conversion
#     $3 : Destination path
#          Default is the current directory 
#######################################################

extension=$1
after=$2
dir=${3-$(pwd)}

for file in *."$extension"
  do
    outfile="$dir"/$(basename "$file" "$extension")"$after"
    case "$after" in
      euc)
        nkf -ed "$file" > "$outfile"
        ;;
      jis)
        nkf -jd "$file" > "$outfile"
        ;;
      utf-8)
        nkf -wd "$file" > "$outfile"
        ;;
      utf-16)
        nkf -w16d "$file" > "$outfile"
        ;;
    esac
  done