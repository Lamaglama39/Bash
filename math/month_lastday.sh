#!/bin/bash
############################################################
# Scrip tName  : month_lastday.sh
# Discription  : Output the last day of each month.
# How to : month_lastday.sh $1
#     $1 : year
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir


#month last date
year=$1
echo "Last day of each month in $year"
seq $year'02' $year'12' | awk '{print}END{print $((year))+89}' |
 awk '{print $1 "01"}' |  xargs -n 1 -I@ date -d "@ 1 day ago" +%Y/%m/%d\(%a\) 2> /dev/null