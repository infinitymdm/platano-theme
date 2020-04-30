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

SRC_DIR="../assets-metacity"
ASSETS_DIR="../../metacity-1"
INDEX="assets-metacity-misc.txt"
KEY_FILE="../../../gtk/sass/common/resources/_key_colors.scss"

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
    $INKSCAPE --export-dpi="$non_scale_dpi" \
              $ink_export_option=$ASSETS_DIR/$i.png $SRC_DIR/$i.svg \
              >/dev/null 2>>../inkscape.log
}

# Generate PNG files
for i in $(<$INDEX)
do
    if [ -f $ASSETS_DIR/$i.png ] && \
        [ $KEY_FILE -ot $ASSETS_DIR/$i.png ]; then
        echo $ASSETS_DIR/$i.png exists.
    elif [ -f $ASSETS_DIR/$i.png ] && \
        [ $KEY_FILE -nt $ASSETS_DIR/$i.png ]; then
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
