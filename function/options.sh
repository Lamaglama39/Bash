# #!bin/bash

# while [ -n "$(echo $1 | grep '-')" ]; do
#   case $1 in
#     -a ) ;;
#     -b ) ;;
#     -c ) ;;
#     *  ) echo 'Usage: alice [-a] [-b] [-c] args...'
#          exit 1
#   esac
#   shift
# done

# while [ -n "$(echo $1 | grep '-')" ]; do
#   case $1 in
#     -a ) ;;
#     -b )
#         shift ;;
#     -c ) ;;
#     *  ) echo 'Usage: alice [-a] [-b] [-c] args...'
#          exit 1
#   esac
#   shift
# done

while getopts ":ab:c" opt; do
  case $1 in
    -a ) ;;
    -b ) ;;
    -c ) ;;
    \? ) echo 'Usage: alice [-a] [-b barg] [-c] args...'
         exit 1
  esac
done

shift $(($OPTIND - 1))