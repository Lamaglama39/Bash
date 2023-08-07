#!/bin/bash
############################################################
# Scrip tName  : link_check.sh
# Discription  : Checking the validity of links in HTML.
# How to : link_check.sh $1
#     $1 : HTML File
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir


#anker link check
cat $1 | grep -oE '(id="[^"]*"|href="#[^"]*")' |
tr -d '#' | tr '=' ' ' | awk '{print $2,$1}' | sort | yarr num=1

#external Link Check
cat $1 | grep -o 'href="[^"]*"' | grep http |
sed 's/^href=//' | awk '{print "curl -f",$1,"> /dev/null"}' | bash -e

#self link check
cat $1 | grep -o 'href="[^"]*"' |
grep -v 'href="http' | grep -v 'href="#' | sed 's/^href=//' |
awk '{print "test -e",$1 " || echo",$1}' | bash -e