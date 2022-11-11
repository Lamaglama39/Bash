#!/bin/bash
############################################################
# Scrip tName  : barcode.sh
# Discription  : Generates barcodes.
# Note         : The following commands must be available.
#              - barcode
#                install: sudo apt install barcode
#              - convert
#                install: sudo apt install imagemagick
#
# How to : barcode.sh $1
#     $1 : number
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

num=$1
echo "$num" | barcode -E > "$num".eps
convert "$num".eps "$num".png