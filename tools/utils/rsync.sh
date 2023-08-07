#!/bin/bash
############################################################
# Scrip tName  : rsync.sh
# Discription  : Synchronize folders specified in the script.
# How to : rsync.sh
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$script_dir"

#Specify the folder to be synchronized
before_dir=/home/user
after_dir=/home/backup

rsync -avu "$before_dir" "$after_dir"
rsync -avu "$after_dir" "$before_dir" 