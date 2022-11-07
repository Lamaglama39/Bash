#!/bin/bash
#############################################################################
# Scrip tName  : pascal_triangle.sh
# Discription  : Calculate Pascal's triangle for the number of commas listed
#                in the brace expansion at the end in the script.
# How to : pascal_triangle.sh
#############################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

eval echo "1" "|
 awk '{print \$0}END{printf \"1 \"; for (i=1; i<NF; i++) {printf \"%s \", \$i+\$(i+1)} print \"1\"}'"{,,,,,,,,}