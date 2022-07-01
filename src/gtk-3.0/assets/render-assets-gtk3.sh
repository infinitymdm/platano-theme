#! /bin/bash
#
# This file is part of plata-theme
#
# Copyright (C) 2018-2020 Tista <tista.gma500@gmail.com>
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#

INKSCAPE="`command -v inkscape`"

SRC_FILE="../assets-gtk3.svg"
ASSETS_DIR="../assets-gtk3"
INDEX_SRC="assets-gtk3.txt"
INDEX=""
KEY_FILE="../../sass/common/_key_colors.scss"

ink_maj_ver="`$INKSCAPE --version | grep Ink | awk '{print $2}' | cut -c 1`"
ink_mnr_ver="`$INKSCAPE --version | grep Ink | awk '{print $2}' | cut -c 3-4`"
if [ "$ink_maj_ver"."$ink_mnr_ver" = 0.91 ]; then
    non_scale_dpi=90
    scale_dpi=180
else
    non_scale_dpi=96
    scale_dpi=192
fi

if [ "$ink_maj_ver" -ge 1 ]; then
    if [ "$ink_mnr_ver" = '0b' ]; then
        ink_export_option="--export-file"
    else
        ink_export_option="--export-filename"
    fi
else
    ink_export_option="--export-png"
fi

#Renderer
render-non-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi="$non_scale_dpi" \
              --export-id-only \
              $ink_export_option=$ASSETS_DIR/$i.png $SRC_FILE \
              >/dev/null 2>>../inkscape.log
}

render-scale() {
    $INKSCAPE --export-id=$i \
              --export-dpi="$scale_dpi" \
              --export-id-only \
              $ink_export_option=$ASSETS_DIR/$i@2.png $SRC_FILE \
              >/dev/null 2>>../inkscape.log
}

# Generate PNG files
case "$1" in
    checkbox)
        INDEX=($(grep -e checkbox $INDEX_SRC))
        ;;
    misc)
        INDEX=($(grep -e thumb -e dev -e needs -e handle -e grip $INDEX_SRC))
        ;;
    radio)
        INDEX=($(grep -e radio $INDEX_SRC))
        ;;
    slider)
        INDEX=($(grep -e slider $INDEX_SRC))
        ;;
    toggle)
        INDEX=($(grep -e toggle $INDEX_SRC))
        ;;
    all)
        INDEX=$(<$INDEX_SRC)
        ;;
    *)
        exit 1
        ;;
esac

if [ '!' -d $ASSETS_DIR ]; then
    mkdir -p $ASSETS_DIR;
fi

for i in ${INDEX[@]}
do 
    if [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i.png ]; then
        echo Re-rendering $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        rm -f $ASSETS_DIR/$i.png
        render-non-scale
    else
        echo Rendering $ASSETS_DIR/$i.png
        echo $i.png >>../inkscape.log
        render-non-scale
    fi

    if [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -ot $ASSETS_DIR/$i@2.png ]; then
        echo $ASSETS_DIR/$i@2.png exists.
    elif [ -f $ASSETS_DIR/$i@2.png ] && [ $KEY_FILE -nt $ASSETS_DIR/$i@2.png ]; then
        echo Re-rendering $ASSETS_DIR/$i@2.png
        echo $i@2.png >>../inkscape.log
        rm -f $ASSETS_DIR/$i@2.png
        render-scale
    else
        echo Rendering $ASSETS_DIR/$i@2.png
        echo $i@2.png >>../inkscape.log
        render-scale
    fi
done
