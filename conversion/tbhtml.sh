#!/bin/bash
#################################################################
# Scrip tName  : tbhtml.sh
# Discription  : Convert text to HTML tables.
#                On the same line, add a <td> tab for each space,
#                and Add a <tr> tag for every new line. 
# How to : tbhtml.sh $1 $2 ...
#     $1 : filename
#     $2 : filename
#################################################################

tbhtml () {
    for tb in "$@"; do
    cat "$tb" |
    awk 'BEGIN{print "<table>"}END{print "</table>"}{print "\t<tr>";for(i=1;i<=NF;i++){print "\t\t<td>"$i"</td>"};print "\t</tr>"}'
    done
}

tbhtml "$@"