#!/bin/bash
#################################################################
# Scrip tName  : mk_dummyfile.sh
# Discription  :Creates a dummy file of the specified capacity.
# How to : mk_dummyfile.sh $1 $2 $3
#     $1 : Specify size(int)
#     $2 : Designation of capacity(str)
#        - GB | MB | KB | BY
#     $3 : Specify the contents of the output file(str)
#        - zero | binary | text
#     $4 : Specify a file name(str)
#################################################################
set -eu

#arguments
size=${1-1}
capacity=${2-MB}
contents=${3-zero}
filename=${4-$size$capacity'_'$contents'.dummy'}

#Variables for commands
ddzero="dd if=/dev/zero"
ddurandom="dd if=/dev/urandom"

#Variables for each capacity
GB="of=$filename bs=1024 count=$((1024**2*size))"
MB="of=$filename bs=1024 count=$((1024*size))"
KB="of=$filename bs=1024 count=$((1*size))"
BY="of=$filename bs=1 count=$((1*size))"

#Null file
zero () {
  if [[ $capacity == GB ]]; then $ddzero $GB
  elif [[ $capacity == MB ]]; then $ddzero $MB
  elif [[ $capacity == KB ]]; then $ddzero $KB
  elif [[ $capacity == BY ]]; then $ddzero $BY
  fi
}
#Binary file
binary () {
  if [[ $capacity == GB ]]; then $ddurandom $GB
  elif [[ $capacity == MB ]]; then $ddurandom $MB
  elif [[ $capacity == KB ]]; then $ddurandom $KB
  elif [[ $capacity == BY ]]; then $ddurandom $BY
  fi
}
#text file
text () {
  if [[ $capacity == GB ]]; then
    cat /dev/urandom | base64 | head -c $((1024**3*size)) > "$filename"
  elif [[ $capacity == MB ]]; then
    cat /dev/urandom | base64 | head -c $((1024**2*size)) > "$filename"
  elif [[ $capacity == KB ]]; then
    cat /dev/urandom | base64 | head -c $((1024*size)) > "$filename"
  elif [[ $capacity == BY ]]; then
    cat /dev/urandom | base64 | head -c $((1*size)) > "$filename"
  fi
}


#run
if [[ -n "$contents" ]]; then
  case $contents in
    zero)
      zero "$size" "$capacity" ;;
    binary) 
      binary "$size" "$capacity" ;;
    text)
      text "$size" "$capacity" ;;
    *)
      echo "syntax error!"
      ;;
  esac
fi