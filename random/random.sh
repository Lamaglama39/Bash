#!/bin/bash

# ランダムな文字列を生成。
#第一引数に桁数を指定。デフォルトは10。第二引数に行数を指定。デフォルトは1。
alias randomStr='_generateRandomString'
function _generateRandomString() {
    local length=${1:-10}
    local line=${2:-1}
    cat < /dev/urandom | base64 | fold -w "$length" | head -n "$line"
}
randomStr 20 5

# ランダムな数値文字列を生成。
#第一引数に桁数を指定。デフォルトは4。第二引数に行数を指定。デフォルトは1。
alias randomStrNum='_generateRandomNumberStr'
function _generateRandomNumberStr() {
    local length=${1:-4}
    local line=${2:-1}
    od -vAn -to1 </dev/urandom  | tr -d " " | fold -w "$length" | head -n "$line"
}
#randomStrNum 10 2

# 指定範囲内のランダムな整数を生成。第一引数に範囲を指定。デフォルトは100。
alias randomNum='_generateRandomNumber'
function _generateRandomNumber() {
    local range=${1:-100}
    awk 'BEGIN{srand();print int(rand() * '"${range}"')}'
}
#randomNum 1000