#!/bin/bash

file1=$1
file2=$2

#if基本文
if1 () {
if [ "$i" -eq 3 ]
then
  echo 'iの値は3です'
elif [ "$i" -eq 5 ]
then
  echo 'iの値は5です'
else
  echo 'iの値は3でも5でもありません'
fi
}


#testコマンド以外を使用したif文
if2 () {
  if cmp -s $1 $2
  then
    echo 'ファイル内容は同じです'
  else
    echo 'ファイル内容は違います'
  fi
}

#if [...] の形式に統一した場合
if3 () {
  cmp -s $1 $2
  if [ $? -eq 0 ]
  then
    echo 'ファイル内容は同じです'
  fi
}

#ifの直前のリストに、cmpとtestの両方記載
if4 () {
  if
    cmp -s $1 $2
    [ $? -eq 0 ]
  then
    echo 'ファイル内容は同じです'
  else
    echo 'ファイル内容は違います'
  fi
}

#ifの条件判断を逆にした場合
if5 () {
  if cmp -s $file1 $file2; [ $? -ne 0 ]
  then
    echo 'ファイル内容は違います'
  else
    echo 'ファイル内容は同じです'
  fi
}

#elseで条件判断を逆にした場合
if6 () {
  if cmp -s $file1 $file2
  then
    :
  else
    echo 'ファイル内容は違います'
  fi
}

#パイプラインの否定演算子を使う場合
if7 () {
  if ! cmp -s $file1 $file2
  then
    echo 'ファイル内容は違います'
  fi
}

#パイプラインを使った条件判断
if8 () {
  if who | grep '^geust\>' > /dev/null
  then
    echo 'guestがログイン中です'
  fi
}

#ifのネスティング
if9 () {
  if [ "$i" -eq 3]
  then
    if [ "$j" -eq 5 ]
    then
      echo "i=3かつj=5です"
    else
      echo "i=3かつj≠5です"
    fi
  else
    if [ "$j" -eq 5 ]
    then
      echo "i≠3かつj=5です"
    else
      echo "i≠3かつj≠5です"
    fi
  fi
}

#ifのネスティングが無駄な場合
if10 () {
  if [ "$i" -eq 3 ]
  then
    echo 'i=3です'
  else
    if [ "$i" -eq 5 ]
    then
      echo 'i=5です'
    fi
  fi
}

#elseを使用した場合
if11 () {
  if [ "$i" -eq 3 ]
  then
    echo 'i=3です'
  elif [ "$i" -eq 5 ]
  then
    echo 'i=5です'
  fi
}