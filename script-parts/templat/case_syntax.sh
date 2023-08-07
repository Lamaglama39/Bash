#!/bin/bash

i=$1

#case基本構文
case1 () {
  case $i in
    start)
      echo 'プログラムを開始します'
      ;;
    stop)
      echo 'プログラムを終了します'
      ;;
    *)
      echo '引数にはstartかstopを付けてください'
      ;;
  esac
}

#コマンド置き換えを使用した場合
case2 () {
  case `uname -s` in
    Linux)
      echo 'OSはLinuxです'
      ;;
    FreeBSD)
      echo 'OSはFreeBSDです'
      ;;
    Solaris)
      echo 'OSはSolarisです'
      ;;
    Ubuntu)
      echo 'OSはUbuntuです'
      ;;
    *)
      echo 'その他OSです'
      ;;
  esac
}

#コマンド置き換えを使用した場合
case3 () {
  case `uname -s` in
    Linux|FreeBSD)
      echo 'OSはLinuxまたはFreeBSDです'
      ;;
    *)
      echo 'その他OSです'
      ;;
  esac
}

#ifを使用した場合
case4 () {
  if [ "$i" = start ]
  then
    echo "プログラムを開始します"
  elif [ "$i" = stop ]
  then
    echo "プログラムを終了します"
  else
    echo "引数にはstartかstopを付けてください"
  fi
}

#パス名展開を使用した場合
string=$1

case5 () {
  case $string in
    [a-z])
      echo 'stringは英小文字1文字です'
      ;;
    ?)
      echo 'stringは1文字です'
      ;;
    file*)
      echo 'stringはfileで始まる文字です'
      ;;
    *)
      echo 'stringはそれ以外の文字です'
      ;;
  esac
}

#ネスティングした場合
case6 () {
  case `uname -s` in
    Linux)
      case `uname -m` in
        ?86*)
          echo 'OSは86版Linuxです'
          ;;
        sparc*)
          echo 'OSはSPARC版Linuxです'
          ;;
        *)
          echo 'OSはその他Linuxです'
          ;;
      esac
      ;;
    *)
      echo 'OSはLinux以外です'
    ;;
  esac
}

#パターンを()で囲んだ場合
case7 () {
  case `uname -s` in
    (Linux)
      echo 'OSはLinuxです'
      ;;
  esac
}

#リストを継続実行する場合
var=$1
case8 () {
  case $var in
    one)
      echo '$varがoneの場合'
      ;&
    two)
      echo '$varがoenまたはtwoの場合'
      ;;
  esac
}

#リストを継続実行する場合
var=$1
case8 () {
  case $var in
    one)
      echo '$varがoneの場合'
      ;;&
    two)
      echo '$varがoenまたはtwoの場合'
      ;;&
    *)
      echo 'すべての場合'
      ;;
  esac
}
case8