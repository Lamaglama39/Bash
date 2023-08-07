#!/bin/bash
############################################################
# Scrip tName  : half_life.sh
# Discription  : Output half-life
# How to : half_life.sh
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

#half life
seq 2000 2010 | awk -v hy=5 -v b=1.0 '{print $1,b;b*=exp(-log(2)/hy)}'