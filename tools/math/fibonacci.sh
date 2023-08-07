#!/bin/bash
#####################################################################
# Scrip tName  : fibonacci.sh
# Discription  : Outputs a specified number of Febonacci numbers.
# How to : fibonacci.sh [ -a||-l ] [ -n int ]
#     -a : Output Febonacci numbers up to the number specified by -n.
#     -l : Outputs the -nth Febonacci number.
#     -n : Specify an integer.
#####################################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir

while getopts aln: option
do
  case $option in
    a)
      output=all;;
    l)
      output=last;;
    n)
      count=$OPTARG;;
    \?)
      echo "Usage: $0 [-a] [-l] [-n number] " 1 >&2
      exit 1;;
  esac
done
shift $(expr "$OPTIND" - 1)
if [ $# -ge 1 ]; then
  echo 'ERROR:Non-optional arguments'"$*"
else
  echo 'SUCCESS:Outputs the Febonacci numbers.'
fi

if [[ "$output" == 'all' ]]; then
  #Outputs the number of Fubonacci up to the specified number.
  awk 'BEGIN{a=0;b=1;while(1){print a;c=a+b;a=b;b=c}}' |
  head -n "${count:-10}" | awk '{print NR ":", $1}'
elif [[ "$output" == 'last' ]]; then
  #How many items Fibonacci
  choice_fib () {
  a=0;b=1;while : ; do c=$(echo "$a+$b" | bc | tr -d '\n\\');
  echo $a;a=$b;b=$c;done | head -n "${count:-10}" | awk '{print NR ":", $1}' | tail -n 1
  }
  choice_fib "${count:-10}"
else :
fi