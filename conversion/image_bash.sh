#/bin/bash

for afile in $(ls *.jpg);do
  todir='格納先フォルダ'
  tofile="リサイズ先ファイル名"
  todir_tofile="$todir$tofile"
  resize='20%'

  echo $afile $tofile
  "C:\Program Files\ImageMagick-7.1.0-Q16-HDRI\magick.exe" convert $afile -resize $resize $todir_tofile

done