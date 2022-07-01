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
SRC_FILE="../assets-gtk2.svg"
ASSETS_DIR="../assets-gtk2"
INDEX_SRC="assets-gtk2.txt"
INDEX=""
KEY_FILE="../../sass/common/_key_colors.scss"

ink_maj_ver="`$INKSCAPE --version | grep Ink | awk '{print $2}' | cut -c 1`"
ink_mnr_ver="`$INKSCAPE --version | grep Ink | awk '{print $2}' | cut -c 3-4`"
if [ "$ink_maj_ver"."$ink_mnr_ver" = 0.91 ]; then
    non_scale_dpi=90
else
    non_scale_dpi=96
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

# Renderer
render-non-scale() {
    ID=`echo $i | tr '/' '_'`
    $INKSCAPE --export-id=$ID \
              --export-dpi="$non_scale_dpi" \
              --export-id-only \
              $ink_export_option=$ASSETS_DIR/$i.png $SRC_FILE \
              >/dev/null 2>>../inkscape.log
}

# Generate PNG files
case "$1" in
    arrow)
        INDEX=($(grep -e Arrows $INDEX_SRC))
        ;;
    button)
        INDEX=($(grep -e Buttons $INDEX_SRC))
        ;;
    checkradio)
        INDEX=($(grep -e Check-Radio $INDEX_SRC))
        ;;
    column)
        INDEX=($(grep -e Column $INDEX_SRC))
        ;;
    entry)
        INDEX=($(grep -e Entry $INDEX_SRC))
        ;;
    handle)
        INDEX=($(grep -e Handles $INDEX_SRC))
        ;;
    misc)
        INDEX=($(grep -e Lines -e Others -e ProgressBar -e Shadows -e Toolbar \
              $INDEX_SRC))
        ;;
    range)
        INDEX=($(grep -e Range $INDEX_SRC))
        ;;
    scrollbar)
        INDEX=($(grep -e Scrollbars $INDEX_SRC))
        ;;
    spin)
        INDEX=($(grep -e Spin $INDEX_SRC))
        ;;
    all)
        INDEX=$(<$INDEX_SRC)
        ;;
    *)
        exit 1
        ;;
esac

for i in ${INDEX[@]}
do
    SUB_DIR=`echo $i | cut -f1 -d '/'`
    if [ '!' -d $ASSETS_DIR/$SUB_DIR ]; then
        mkdir -p $ASSETS_DIR/$SUB_DIR; 
    fi

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
done

exit 0
