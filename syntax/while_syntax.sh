#!/bin/bash

#while文を1行で記述する場合
while1 () {
  i=1
  while [ "$i" -le 10 ]; do echo "$i"; i=`expr "$i" + 1`; done
}

#whileの基本構文
while2 () {
  sum=0
  i=1
  while [ "$i" -le 100 ]
  do
    sum=`expr "$sum" + "$i"`
    i=`expr "$i" + 1`
    echo "$i"
  done
  echo "$sum"
}

#10回ループする場合
while3 () {
  i=1
  while [ "$i" -le 10 ]
  do
    echo "$i"
    i=`expr "$i" + 1`
  done
}

#シェルスクリプトの引数の数だけループする場合
while4 () {
  while [ $# -gt 0 ]
  do
    cp -p "$1" "$1".bak
  done
}

#while文の中にcase文を記述した場合
while5 () {
  suffix=.bak
  dir=.

  while [ $# -gt 0 ]
  do
    case $1 in
      -s)
        suffix="$2"
        shift
        ;;
      -d)
        dir="$2"
        shift
        ;;
      *)
        break
        ;;
    esac
    shift
  done

  while [ $# -gt 0 ]
  do
    cp -p "$1" "$dir"/"$1""$suffix"
    shift
  done
}

#while文での無限ループ
while6 () {
  while :
  do
    echo loop
  done
}

#リストがない場合
while7 () {
  while read line
  do
    :
  done
}