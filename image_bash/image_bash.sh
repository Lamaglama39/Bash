#/bin/bash

for afile in $(ls *.jpg);do
  tofile="resize_${afile}"
  echo $afile $tofile
  "C:\Program Files\ImageMagick-7.1.0-Q16-HDRI\magick.exe" convert $afile -resize 20% $tofile

done
