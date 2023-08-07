#!/bin/bash
############################################################
# Scrip tName  : reverse.sh
# Discription  : Outputs a negative processed image file.
# How to : reverse.sh $1
#     $1 : image file
############################################################
set -euo pipefail
script_dir=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd $script_dir


#var
name_ppm=${1%.*}.ppm
extension=${1##*.}
intermediate_file=tmp
body_file=body
outfile=after_image.ppm
outfile2=${outfile%.*}
if [[ $1 == *.ppm ]];then
  :
  else
    convert -compress none $1 $name_ppm
fi


convert_ppm () {
#Remove comments
sed 's/#.*$//' |
tr ' ' '\n' |
#Remove blank lines
awk 'NF==1' |
#Make one line of RGB pairs and add width information at the end
awk 'NR==2{w=$1}NR>=5{printf("%d ",$1);if(NR%3==1){print w}}' |
#Output: $1:R $2:G $3:B $4:width
#attach vertical and horizontal positions to RGB values
awk '{n=NR-1;print int(n/$4),n%$4,$1,$2,$3}' |
#Fill coordinates with zeros for digit matching
awk '{print sprintf("%04d %04d",$1,$2),$3,$4,$5}'  
#coordinates 3-5. R,G,B values
}
cat $name_ppm | convert_ppm > $intermediate_file


#make image
cat $intermediate_file | awk '{print 255-$3,255-$4,255-$5}' > $body_file
head -n 3 $name_ppm | cat - $body_file > $outfile
convert $outfile $outfile2.$extension

rm $name_ppm $intermediate_file $body_file $outfile