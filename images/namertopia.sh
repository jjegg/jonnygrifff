#!/bin/bash
# rename images
# bash namertopia.sh path/to/my/images

setup_mac () {
   sudo chown -R $(whoami) $(brew --prefix)/* 
   brew install imagemagick
}

resize () { 
    echo "starting resizing"
    cd $1
    a=1
    for i in *.jpg; do
        new=$(printf "%02d.jpg" "$a")
        convert "$new[$2x]" "$new"
        let a=a+1
    done
}

rename () {
    echo "starting rename"
    cd $1
    a=1
    total=`ls | wc -l`
    for i in *.jpg; do
        echo "[$a | $total]: Renaming $i"
        new=$(printf "%02d.jpg" "$a")
        mv "$i" "$new"
        let a=a+1
    done
}
$@
# if declare -f "$1" > /dev/null
# then
#   "$@"
# else
#   echo "'$1' is not a known function name" >&2
#   echo "EXAMPLE COMMAND:" >&2
#   echo "./namertopia.sh rename directory/of/photos" >&2
#   echo "./namertopia.sh resize directory/of/photos 1800" >&2
#   exit 1
# fi