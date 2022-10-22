#!/bin/bash
##################################################
# Scrip tName  : eucjp.sh
# Discription  : EUC-JP character list output
# How to : kanji_list.sh
##################################################

LANG=ja_JP.eucJP

for d3 in {a..f}
do
  group=
  for d2 in {0..9} {a..f}
  do
    case $d3$d2 in
      a0|ff)
        continue;;
    esac
  
    block=
    for d1 in {a..f}
    do
      line=$d3$d2$d1'0 '
      for d0 in {0..9} {a..f}
      do
        case $d1$d0 in
          a0|ff)
            line=$line'  ';;
          *)
            line=$line\\x$d3$d2\\x$d1$d0;;
        esac
      done
      block=$block$line\\n
    done
    group=$group$block
  done
  printf "$group"
done

