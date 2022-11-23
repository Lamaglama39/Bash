#!/bin/bash
############################################################
# Scrip tName  : primenumber.sh
# Discription  : Output prime numbers.
# How to : primenumber.sh
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

#prime number
seq 1 100 | factor | awk 'NF==2{print $2}'