#!/bin/bash
######################################################################
# Scrip tName  : random.sh
# Discription  : Generates random values.
# How to : randomStr $1 $2
#          randomStrNum $1 $2
#     $1 : Number of digits of value to be generated
#     $2 : Number of row digits to be generated
#
# How to : randomNum $1
#     $1 : Maximum number of numbers to be generated.
######################################################################

#Generate random string
alias randomStr='_generateRandomString'
function _generateRandomString() {
    local length=${1:-10}
    local line=${2:-1}
    cat < /dev/urandom | base64 | fold -w "$length" | head -n "$line"
}
randomStr 20 5

#Generate random numeric string
alias randomStrNum='_generateRandomNumberStr'
function _generateRandomNumberStr() {
    local length=${1:-4}
    local line=${2:-1}
    od -vAn -to1 </dev/urandom  | tr -d " " | fold -w "$length" | head -n "$line"
}
randomStrNum 10 2

#Create random integer
alias randomNum='_generateRandomNumber'
function _generateRandomNumber() {
    local range=${1:-100}
    awk 'BEGIN{srand();print int(rand() * '"${range}"')}'
}
randomNum 1000