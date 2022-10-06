#!/bin/bash

decimal=$*
for dec in $decimal
do
  printf 'Hexadecimal: %02x\n' "$dec"
  printf 'DecimalNumber: %d\n' "$dec"
done