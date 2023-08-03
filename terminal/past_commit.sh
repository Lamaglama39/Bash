#!/bin/bash
############################################################
# Scrip tName  : past_commit.sh
# Discription  : Outputs a random commit time.
# Option : past_commit.sh -Y -M -D -h -m -s
#        -Y : year    (example: 2023)
#        -M : month   (example: Jan)
#        -D : day     (example: 10)
#        -h : hour    (example: 23)
#        -m : minutes (example: 59)
#        -s : seconds (example: 59)
############################################################
set -euo pipefail

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

# Setting Commit Time
BASE_TIME="${month:-$(date | awk '{print $2}')} ${day:-$(date | awk '{print $3}')} ${hour:-$((RANDOM%4 + 20))}:${minutes:-$((RANDOM%60))}:${second:-$((RANDOM%60))} ${year:-$(date | awk '{print $6}')} +0900"
export GIT_AUTHOR_DATE=$BASE_TIME
export GIT_COMMITTER_DATE=$BASE_TIME

echo "AUTHOR_DATE:    $GIT_AUTHOR_DATE"
echo "COMMITTER_DATE: $GIT_COMMITTER_DATE"

git commit

unset GIT_AUTHOR_DATE
unset GIT_COMMITTER_DATE
