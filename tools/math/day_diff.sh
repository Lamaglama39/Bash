#!/bin/bash
##############################################################
# Scrip tName  : day_diff.sh
# Discription  : Output the number of days between two dates.
# How to : day_diff.sh $1 $2
#     $1 : before date
#     $2 : after date
##############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

before=$1
after=$2
#Displays the difference in number of days
echo "Before day:" $(date -d "$before" +%Y/%m/%d\(%a\))
echo "After  day:" $(date -d "$after" +%Y/%m/%d\(%a\))
echo -n "difference: days"
echo $1 $2 | tr ' ' '\n' | date -f - +%s | tr '\n' ' ' |
 awk '{print $2 -$1}' | awk '{print $1/(60*60*24)}'