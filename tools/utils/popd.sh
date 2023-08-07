#!/bin/bash

popd()
{
  if [ $(echo $1 | grep '^+[0-9][0-9]*$') ]; then
    
    # popd +N: スタックからN番目のディレクトリを削除する
    let num=${1#+}
    getNdirs $num
    DIR_STACK="$stackfront$DIR_STACK"
    cd ${DIR_STACK%% *}
    echo "$PWD"
  
  else
    #通常の引数なしのpopd:
    if [ -n "$DIR_STACK" ]; then
      DIR_STACK=${DIR_STACK#* }
      cd ${DIR_STACK%% *}
      echo "$PWD"
    else
      echo "stack empty, still in $PWD."
    fi
  fi
}