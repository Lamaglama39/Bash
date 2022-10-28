#!/bin/bash
#########################################################################################
# Scrip tName  : path_line.sh
# Discription  : The values set in the PATH environment variable are output line by line.
#                It does nothing else...
# How to : path_line.sh
#########################################################################################

echo -e "${PATH//:/'\n'}" | sort
echo -e "${PATH//:/'\n'}" | echo 'Total: '"$(wc -l)"