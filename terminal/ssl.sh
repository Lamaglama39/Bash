#!/bin/bash
######################################################################################
# Scrip tName  : ssl.sh
# Discription  : Shells that make openssl easier to use.
# About Arguments : -c       :Key making
#                   -e       :encryption
#                   -d       :decoding
#                   -s <str> :private key
#                   -p <str> :public key
#                   -b <str> :Files to be encrypted
#                   -o <str> :Files after encryption
# How to : 
# - create key : ssl.sh -c -s <seckey name> -p <pubkey name> 
# - encrypt    : ssl.sh -e -s <seckey name> -p <pubkey name> -b <basefile> -o <outfile>
# - decrypt    : ssl.sh -d -s <seckey name> -o <outfile>
#
######################################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts ceds:p:b:o: option
do
  case $option in
    c)
      action=create;;
    e)
      action=encrypt;;
    d)
      action=decrypt;;
    s)
      seckey=$OPTARG;;
    p)
      pubkey=$OPTARG;;
    b)
      basefile=$OPTARG;;
    o)
      outfile=$OPTARG;;
    \?)
      echo "Usage: $0 [-c] [-e] [-d] [-s sec.key] [-p pub.key]" 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Correct arguments were specified.'
fi

#Create private and public keys
if [[ $action == 'create' ]]; then
  openssl genrsa -out ${seckey:-'sec.key'} -aes256 2048
  openssl rsa -in ${seckey:-'sec.key'} -pubout -out ${pubkey:-'pub.key'}
#Cryptographic process
elif [[ $action == 'encrypt' ]]; then
  openssl rsautl -pubin -inkey ${pubkey:-'pub.key'} -in $basefile -encrypt -out ${outfile:-$basefile.'secret'}
#Decoding process
elif [[ $action == 'decrypt' ]]; then
  cat $outfile | openssl rsautl -decrypt -inkey ${seckey:-'sec.key'}
else echo "ERROR"
fi