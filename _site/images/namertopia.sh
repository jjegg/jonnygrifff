#!/bin/bash
# rename images
# bash namertopia.sh path/to/my/images

cd $1
COUNTER=10
for f in *; do 
    mv "$f" "$COUNTER.jpg"
    COUNTER=$[COUNTER + 01]
done