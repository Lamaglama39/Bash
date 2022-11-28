#!/bin/bash
############################################################
# Scrip tName  : past_commit.sh
# Discription  : Outputs a random commit time.
# How to : past_commit.sh -Y -M -D -h -m -s
#     -Y : Specify what year
#     -M : Specify what month
#     -D : Specify what day
#     -h : Specify what hour
#     -m : Specify what hour
#     -s : Specify what hour
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts Y:M:D:h:m:s: option
do
  case $option in
    Y)
      year=$OPTARG;;
    M)
      month=$OPTARG;;
    D)
      day=$OPTARG;;
    h)
      hour=$OPTARG;;
    m)
      minutes=$OPTARG;;
    s)
      second=$OPTARG;;
    \?)
      echo "Usage: $0 [-Y] [-M] [-D] [-h] [-m] [-s]" 1>&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Outputs a random commit time.'
fi

echo "git commit --date=\"${month:-$(date | awk '{print $2}')} ${day:-$(date | awk '{print $3}')}" \
     "${hour:-$((RANDOM%3+21))}:${minutes:-$((RANDOM%60))}:${second:-$((RANDOM%60))}" \
     "${year:-$(date | awk '{print $6}')} +0900\""