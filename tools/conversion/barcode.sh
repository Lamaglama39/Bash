#!/bin/bash
############################################################
# Scrip tName  : barcode.sh
# Discription  : Generates barcodes.
# Note         : The following commands must be available.
#              - barcode
#                install: sudo apt install barcode
#              - convert
#                install: sudo apt install imagemagick
#
# How to : barcode.sh $1
#     $1 : number
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts epjgn:f: option
do
  case $option in
    e)
      format=eps;;
    p)
      format=pdf;;
    j)
      format=jpeg;;
    g)
      format=png;;
    n)
      num=$OPTARG;;
    f)
      filename=$OPTARG;;
    \?)
      echo "Usage: $0 [-e(eps)] [-p(pdf)] [-j(jpeg)] [-g(png)] [-n number] [-f filename]" 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Correct arguments were specified.'
fi

echo "$num" | barcode -E > "${filename:-$num}".eps
if [[ $format == 'eps' ]]; then
  :
elif [[ $format == 'pdf' ]]; then
  convert "${filename:-$num}".eps "${filename:-$num}".pdf
  rm "${filename:-$num}".eps
elif [[ $format == 'jpeg' ]]; then
  convert "${filename:-$num}".eps "${filename:-$num}".jpeg
  rm "${filename:-$num}".eps
elif [[ $format == 'png' ]]; then
  convert "${filename:-$num}".eps "${filename:-$num}".png
  rm "${filename:-$num}".eps
else
:
fi