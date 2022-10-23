#!/bin/bash
##############################################################
# Scrip tName  : decimal.sh
# Discription  : prints the number specified 
#                by the argument in hexadecimal and decimal.
# How to : decimal.sh $1 $2 ...
#     $1 : Any number
#     $2 : Any number
##############################################################

decimal=$*
for dec in $decimal
do
  printf 'Hexadecimal: %02x\n' "$dec"
  printf 'DecimalNumber: %d\n' "$dec"
done