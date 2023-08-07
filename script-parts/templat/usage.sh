#!/bin/bash
#######################################################
# Scrip tName  : usage.sh
# Discription  :Use it by embedding it in a function
#               or calling it from within a function.
#######################################################

usage () {
cat >&2 <<EOF
Command description:

[usage]
  $0 <ARG1> <ARG2> [options]

[args]
  ARG1: first argument
  ARG2: second argument

[options]
  -h | --help:
    how help
  -k | --key:
    Option of type specifying only the option name
  -v | --key-value <VALUE>:
    Options that require a value
  -r | --required <VALUE>:
    Mandatory options

[example]
   $0 one two -r three
EOF
exit 1
}