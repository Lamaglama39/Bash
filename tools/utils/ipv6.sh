#!/bin/bash
############################################################
# Scrip tName  : ipv6.sh
# Discription  : Output full IPv6.
# How to : ipv6.sh $1
#     $1 : IPv6 address
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

echo $1 |
 sed 's/::/:x:/' |  tr : ' ' | awk '{for(i=1;i<=NF;i++){print 8-NF,$i}}' |
 awk '/x/{for(i=0;i<=$1;i++){print}}!/x/{print}' |
 tr x 0 | sed 's/^. /000/' | sed 's/0*\(....\)$/\1/' | xargs | tr ' ' :