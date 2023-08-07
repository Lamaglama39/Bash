#!/bin/bash
############################################################
# Scrip tName  : check_fstab.sh
# Discription  : Check fstab description.
# How to : check_fstab.sh
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

#UUID acquisition
fstab_list=$(cat /etc/fstab | awk '{print $1}' | grep "UUID=*" | sed 's/UUID=//')
fstab_count=$(echo $fstab_list | wc -w)
blkid_list=$(blkid -s UUID | awk '{print $2}' | sed 's/UUID=//' | sed 's/"//g')
blkid_count=$(echo $blkid_list | wc -w)

#UUID normalized number obtained by fstab and blkid
if [[ "$fstab_count" == "$blkid_count" ]]; then
  :
  else
  echo "The number of UUIDs does not match."
  echo "/etc/fstab:$fstab_count" "blkid:$blkid_count"
  exit 8
fi

#Comparison of UUIDs obtained by fstab and blkid
while read -r line
do
  echo $blkid_list | grep "$line" > /dev/null || echo "Inconsistent UUIDs:$line"
done < <(echo $fstab_list | sed 's/ /\n/g' )