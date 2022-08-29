#!/bin/bashi

#filename=$1
#outfile=${filename%.pcx}.jpg
#touch ${outfile}

for filename in "$@"; do
  pnmfile=${filename%.*}.ppm

  case $filename in
    *.jpg ) exit 0;;

    *.tga ) tgatoppm $filename > $pnmfile ;;

    *.xpm ) xpmtoppm $filename > $pnmfile ;;

    *.pcx ) pcxtoppm $filename > $pnmfile ;;

    *.tif ) tiftoppm $filename > $pnmfile ;;
    
    *.gif ) giftoppm $filename > $pnmfile ;;

      * ) echo "profile: $filename is an unknown graphics file."
          exit 1  ;;
    esac
    
    outfile=${pnmfile%.ppm}.new.jpg

    pnmtojpg -$pnmfile > $outfile

    rm $pnmfile

done