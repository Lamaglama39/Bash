#!/bin/bash
#################################################################################
# Scrip tName  : archive.sh
# Discription  : Archives all text files under the specified directory into one.
#                Restore the archive and return it to its original structure.
# How to : archive.sh -c dirname
#     -c : specify the directory to archive.
#
#        : archive.sh -c filename
#     -x : specify archives to expand.
#################################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$script_dir"

while getopts c:x: option
do
  case $option in
    c)
      #archive creation
      archive_dir=${OPTARG%%/}
      archive_file="$archive_dir"'.archive'

      grep -r ^ "$archive_dir" > "$archive_file";;
    x)
      #expand archive
      archive_dir=${OPTARG%%.archive}
      archive_file="$OPTARG"

      cat "$archive_file" | sed 's/:.*$//' | xargs dirname | sort -u | xargs mkdir -p
      cat "$archive_file" | awk -F: '{print > $1}'
      find "$archive_dir" -type f | xargs sed -i 's/[^:]*://';;
    \?)
      echo "Usage: $0 [-c dirname] [-x filename]" 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)