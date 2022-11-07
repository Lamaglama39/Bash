#!/bin/bash
######################################################################
# Scrip tName  : rotation.sh
# Discription  : Rotate logs in the directory specified in the script.
# How to : Run manually or set in cron.
######################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

#script log dir
script_log_dir=/var/log/example_script
cd $script_log_dir
exec  >& ./$(basename $0).$(date +%Y%m%d%H%M%S).log

#rotating logs
log_dir=/home/user/script/example_log
cd $log_dir

#log output directory
today_dir="$(date +%Y%m%d)"
[ "$today_dir" -gt '20220101' ]
[ ! -e "$today_dir.tar.gz" ]
mkdir -p "$today_dir"

#log rotation
find -daystart -mtime 1 | grep './' | xargs -I@ mv  @ "./$today_dir/"
tar -zcvf "$today_dir.tar.gz" "./$today_dir/"
rm -Rf "./$today_dir/"