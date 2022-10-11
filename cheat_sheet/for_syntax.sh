#!/bin/bash

#for文を1行で記述する場合
for1 (){
  for let in list1 list2; do echo "$let"; done
}

#for基本構文
for2 () {
  memo1=$1
  memo2=$2

  for file in $memo1 $memo2
  do
    cp -p "$file" "$file".bak
  done
}

#パス名展開を利用した場合
for3 () {
  for file in *
  do
    cp -p "$file" "$file".bak
  done
}

#コマンド置き換えを利用した場合
for4 () {
  for file in `cat filelist`
  do
    cp -p "$file" "$file".bak
  done
}

#引数の数だけループ
for5 () {
  for file in "$@"
  do
    cp -p "$file" "$file".bak
  done
}

#for文の中に他の構文を入れた場合
for6 () {
  for file in *
  do
    case $file in
      *.bak)
        ;;
      *)
        cp -p "$file" "$file".bak
        ;;
    esac
  done
}

#continueを利用した場合
for7 () {
  for file in *
  do
    case $file in
      *.bak)
        continue
        ;;
    esac
    cp -p "$file" "$file".bak
  done
}

#10回のループ
for8 () {
  for i in 1 2 3 4 5 6 7 8 9
  do
    echo "$i"
  done
}

#100回のループ
for9 () {
  for i in '' 1 2 3 4 5 6 7 8 9
  do
    for j in 0 1 2 3 4 5 6 7 8 9
    do
      echo "$j$i"
    done
  done
}

#リストがない場合
for10 () {
  for i in 1 2 3
  do
    :
  done
}

#算術式を利用した場合
for11 () {
  sum=0
  for ((i = 1; i <= 100; i++)) {
    ((sum = i))
    echo "$sum"
  } 
}