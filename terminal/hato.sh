#!/bin/bash
############################################################
# Scrip tName  : hato.sh
# Discription  : They will be invaded by pigeons.
# How to : hato.sh
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

hatoexit () {
 echo
 echo 'hato@remote:̃$ '
}

trap hatoexit 2

for i in {1..100} ; do
 echo 'hato@remote:̃$ '
 done

 while : ; do
 echo -n 'hato@remote:̃$ '
 read str

 num=$RANDOM
 if [[ $((${num} % 2)) = 0 ]]; then
   sed 's/[^0-9ー ?!]/ポ/g' <<< "$str"
   else sed 's/[^0-9ー ?!]/ポッポ/g' <<< "$str"
 fi
done