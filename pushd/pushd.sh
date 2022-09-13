#!/bin/bash

pushd ()
{
  if [ $(echo $1 | grep '^+[0-9][0-9]*$')]; then
    
    #pushd +N: N番目のディレクトリを先頭に持ってくる
    let num=${1#+}
    getNdirs $num

    DIR_STACK="$target$stackfront$DIR_STACK"
    cd $target
    edho "$DIR_STACK"

  elif [ -z "$1" ]; then
    #　引数なしのpushd: 先頭の2つのディレクトリを入れ替える
    firstdir=${DIR_STACK%% *}
    DIR_STACK=${DIR_STACK#* }
    seconddir=${DIR_STACK%% *}
    DIR_STACK=${DIR_STACK#* }
    DIR_STACK="$seconddir $firstdir $DIR_STACK"
    cd $seconddir

  else
    #通常のpushd dirname:
    dirname=$1
    if [ \( -d $dirname \) -a \( -x $dirname \) ]; then
      DIR_STACK="$dirname ${DIR_STACK:-$PWD}"
      cd $dirname
      echo "$DIR_STACK"
    else
      echo still in "$PWD."
    fi
  fi
}