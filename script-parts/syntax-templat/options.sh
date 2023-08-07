#!/bin/bash
######################################################################
# Scrip tName  : options.sh
# Discription  : Implement in function for argument checking.
# How to : options.sh
######################################################################

options () {
  while getopts ":a:b:c" OPT
  do
    case $OPT in
      "a" ) echo "$OPTARG";;
      "b" ) echo "$OPTARG";;
      "c" ) echo "$OPTARG";;
      * ) echo 'Usage: alice [-a] [-b barg] [-c] args...'
           exit 1
    esac
  done

  shift $(($OPTIND - 1))
}
options "$@"