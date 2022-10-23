#!/bin/bash
############################################################
# Scrip tName  : echocheck.sh
# Discription  : Specifies a redirect 
#                and checks for correct output destination.
# How to : echocheck.sh <redirect>
############################################################

echo "This is a stdout"
echo "This is a stderr" 1>&2