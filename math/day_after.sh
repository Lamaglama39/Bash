#!/bin/bash
#############################################################################
# Scrip tName  : day.sh
# Discription  : Outputs the date and time after a specified number of days.
# How to : day.sh $1 $2
#     $1 : before day
#     $2 : after date
#############################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

original_day=$(date -d $1 +%Y/%m/%d\(%a\))
after_date=$2

#Number of days after
echo "Before day: $original_day"
echo "After  day:" $(date -d "$original_day"" $after_date"' day' +%Y/%m/%d\(%a\))
echo "difference: $after_date days"