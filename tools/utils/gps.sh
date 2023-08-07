#!/bin/bash
############################################################
# Scrip tName  : gps.sh
# Discription  : Output location information of jpg files.
# How to : gps.sh $1 $2 ...
#     $1 : jpg file
#     $2 : jpg file
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir


touch pos
echo POS >> pos
echo '(%1)+(%2)/60+(%3)/3600' >> pos
echo POS >> pos

convert_gps () {
for fname in $@
do
  echo $fname
  identify -verbose $fname | grep GPSL | xargs -n 6 | self 2 3 4 6 | tr ',/' ' ' | awk '{print $1/$2"°"$3/$4 + $5/($6*60)"'\''" $7}' | yarr | tr ' ' ','
  identify -verbose $fname |
  grep -E 'GPS(Latitude|Longitude):' | sed 's/.*://' |
  tr -d , | mojihame -lPOS pos - | bc -l
  echo "---------------------"
done
}

convert_gps $@
rm pos