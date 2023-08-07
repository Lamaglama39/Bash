#!/bin/bash
######################################################################
# Scrip tName  : ansi.sh
# Discription  : Converting image files to ansi.
#                It will be able to display images on the terminal.
# requirement  : Installing ImageMagick
# How to : ansi.sh $1 $2 ...
#     $1 : finename
#     $2 : cols
######################################################################

# for replace transparent color
transparent_before="255;0;255"
transparent_after="16;16;16"

# convert image to ppm and output to stdout
fname=$(echo $1 | sed 's/\.[^\.]*$//')
ppm=$(convert ${1:-a} -compress none ppm:- 2>/dev/null)

# convert error check
if [ -z "${ppm}" ] ; then
    echo -e "Convert Error or Imagemagick is not installed.\nUsage: ${0} <any dot image>"
    exit 1
fi

#  set ppm data to positional parameter,
# get cols, then discard ppm parameters
set ${ppm}
cols=${2}
shift 4

{
    # get three each values (rgb) from ppm
    for i in $(eval echo {1..${#}..3})
    do
        j=$((i+1))
        k=$((i+2))

        rgb="${!i};${!j};${!k}"

        # replace transparent color
       if [ ${rgb} == ${transparent_before} ] ; then
         rgb=${transparent_after}
       fi

        # start a new line when reach cols
        if [ $(( (${i} + 2) / 3 % ${cols} )) -eq 0 ] ; then
          echo -e "\033[48;2;${rgb}m  \033[m"
        else
          echo -en "\033[48;2;${rgb}m  \033[m"
        fi
    done
} > ./"$fname".ansi

exit 0