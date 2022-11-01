#!/bin/bash
##################################################################################
# Scrip tName  : hphtml.sh
# Discription  : Add <h> tag to the first line of text,
#                Add a <p> tag to each subsequent line of text with a line break.
# How to : hphtml.sh $1 $2 ...
#     $1 : filename
#     $2 : filename
##################################################################################

hphtml () {
    for hp in "$@" ; do
        cat "$hp"  | awk 'NF==0{print ""}NF!=0{printf($0)}' |
        awk 'NR==1{print "<h1>"$0"</h1>"}NR!=1{print "<p>"$0"</p>"}' |
        sed 's/、/&\n/g' | sed 's/。/&\n/g' | sed 's/<p>/\n&/g'
    done
}

hphtml "$@"