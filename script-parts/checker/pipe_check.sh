#!/bin/bash
############################################################
# Scrip tName  : pipe_check.sh
# Discription  : Verify that the pipe is completed correctly.
#                Called and used in a function.
# How to : command1 | command2 | commmand3
#          pipe_check.sh
############################################################

pipe_check(){
 [ "$(tr -d ' 0' <<< ${PIPESTATUS[@]})" = "" ] && return
 echo "error: $0" >&2
 exit 1
}

##test
#OK pattern
(echo hoge hoge | sed 's/\(.*\)/\U\1/')
pipe_check

#NG pattern
(echo hoge hoge | sad 's/\(.*\)/\U\1/')
pipe_check