#!/bin/bash
############################################################################
# Scrip tName  : qrcode.sh
# Discription  : Creates a QR Code with the specified extension.
# How to : qrcode.sh -u https://www.example.com/ -o filename -e|-p|-j|-g 
#     -u : url
#     -o : output file name
#     -e : eps format
#     -p : pdf format
#     -j : jpeg format
#     -g : png format
############################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts epjgu:o: option
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
    u)
      url=$OPTARG;;
    o)
      outfile=$OPTARG;;
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

qrencode -o "${outfile:-qr}".png "$url"

if [[ $format == 'png' ]]; then
  :
elif [[ $format == 'pdf' ]]; then
  convert "${outfile:-qr}".png "${outfile:-qr}".pdf
  rm "${outfile:-qr}".png
elif [[ $format == 'jpeg' ]]; then
  convert "${outfile:-qr}".png "${outfile:-qr}".jpeg
  rm "${outfile:-qr}".png
elif [[ $format == 'eps' ]]; then
  convert "${outfile:-qr}".png "${outfile:-qr}".eps
  rm "${outfile:-qr}".png
else
:
fi