#!/bin/bash
#################################################################
# Scrip tName  : swap.sh
# Discription  : Automatically creates and deletes swap files.
#                Executing as root user.
# How to : swap.sh -c|-d -s int -f str
#     -c : create swap
#     -d : delete swap
#     -s : swap size (default 1GB)
#     -d : swap filename (default /var/swap)
#################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir


while getopts cds:f: option
do
  case $option in
    c)
      action=create;;
    d)
      action=delete;;
    s)
      size=$OPTARG;;
    f)
      filename=$OPTARG;;
    \?)
      echo "Usage: $0 [-c] [-d] [-s size] [-f filename] " 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Correct arguments were specified.'
fi

# create swap
if [[ $action == 'create' ]]; then
   dd if=/dev/zero of="${filename:-/var/swap}" bs="${size:-1}"M count=1024
   mkswap "${filename:-/var/swap}"
   chmod 600 "${filename:-/var/swap}"
   swapon "${filename:-/var/swap}"
   echo "${filename:-/var/swap}""         swap                    swap    defaults        0 0" >> /etc/fstab
   free
elif [[ $action == 'delete' ]]; then
# delete swap
   swapoff /var/swap
   cat /etc/fstab | sed "s@${filename:-/var/swap}         swap                    swap    defaults        0 0@@g" > /etc/fstab.org
   mv /etc/fstab.org /etc/fstab
   rm "${filename:-/var/swap}"
   free
fi