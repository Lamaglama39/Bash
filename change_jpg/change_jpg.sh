#!/bin/bashi

#Default
size=320
width=1
colour="-color black"
usage="Usage: $0 [-s N] [-w N] [-c S] imagefile..."

while getopts ":s:w:c" opt; do
  case $opt in
    s  ) size=$OPTARG ;;
    w  ) width=$OPTARG ;;
    c  ) colour="-color $OPTARG" ;;
    \? ) echo $usage 
         exit 1
  esac
done

shift $(($OPTIND -1))

if [ -z "$@" ]; then
  echo $usage
  exit 1
fi

#入力ファイル処理
for filename in "$*"; do
  pnmfile=${filename%.*}.ppm

  case $filename in

    *.gif ) giftopnm $filename > $ppmfile ;;

    *.tga ) tgatoppm $filename > $ppmfile ;;

    *.xpm ) xpmtoppm $filename > $ppmfile ;;

    *.pcx ) pcxtoppm $filename > $ppmfile ;;

    *.tif ) tifftopnm $filename > $ppmfile ;;
    
    *.jpg ) jpegtopnm -quiet $filename > $ppmfile ;;

    * ) echo "$0: Unknown filetype '${filename##*.}'"
        exit 1  ;;
  esac
    
  outfile=${ppmfile%.ppm}.new.jpg
  
  pnmscale -quiet -xysize $size $size $ppmfile |
    pnmmargin $colour $width |
    pnmtojpeg > $outfile

  rm $ppmfile

done