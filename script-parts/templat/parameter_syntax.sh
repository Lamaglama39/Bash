#!/bin/bash

#parameter=
parameter2=
#parameter3=
parameter4=
parameter5=
parameter6='Para6'
parameter7='Para7'
parameter8='Para8'
parameter9='Para9'
parameter10='Para10'
parameter11='Para11'
parameter12='Para12'
parameter13='Para13'
parameter14='parameter14'
parameter15='parameter15'
parameter16='parameter16'
parameter17='parameter17'

Para18=Hello
parameter18=Para18

#未設定の場合デフォルト値を指定
echo "${parameter-set1}"
#未設定、または空文字の場合デフォルト値を指定
echo "${parameter2:-set2}"

#未設定の場合デフォルト値を代入
echo "${parameter3=set3}"
#未設定、または空文字の場合デフォルト値を代入
echo "${parameter4:=set4}"

#未設定の場合エラーを出力しシェルスクリプトを終了する
echo "${parameter5?パラメータ5が指定されていません}"
#未設定、空文字の場合エラーを出力しシェルスクリプトを終了する
echo "${parameter6:?パラメータ6が指定されていません}"

#設定されている場合に指定の値に展開する
echo "${parameter7+PARA7\+\+}"
#空文字以外に設定されている場合に指定の値に展開する
echo "${parameter8:+PARA8\-\+\-\+}"

#パラメータの長さを求める
echo "${#parameter9}"

#パラメータの文字列の左側から、最短のパターンを取り除く
echo "${parameter10#Pa}"
#パラメータの文字列の左側から、最長のパターンを取り除く
echo "${parameter11##Pa}"

#パラメータの文字列の左側から、最短のパターンを取り除く
echo "${parameter12%ra*}"
#パラメータの文字列の左側から、最長のパターンを取り除く
echo "${parameter13%%ra*}"

#オフセットを指定して文字列を切り出す
echo "${parameter14:2}"
#オフセット、長さを指定して文字列を切り出す
echo "${parameter15:2:4}"

#パターンを指定してパラメータの値を文字列を置換
echo "${parameter16/a/A}"
#パターンを指定してパラメータの値を文字列をすべて置換
echo "${parameter17//a/A}"

#指定した文字列で始まる変数名の一覧を表示
echo "${!parameter@}"
#指定した文字列で始まる変数名の一覧を表示
echo "${!parameter*}"

#パラメータをパラメータ名とみなし、その値を参照する
echo "${!parameter18}"