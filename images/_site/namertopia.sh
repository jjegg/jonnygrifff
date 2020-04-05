#!/bin/bash
# rename images
# bash namertopia.sh path/to/my/images

cd $1
a=1
for i in *.jpg; do
  new=$(printf "%02d.jpg" "$a")
  mv -i -- "$i" "$new"
  let a=a+1
done
