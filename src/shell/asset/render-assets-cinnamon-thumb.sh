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

SRC_DIR="assets-cinnamon/mixed/misc"
SRC_DARK_DIR="assets-cinnamon/dark/misc"
SRC_LIGHT_DIR="assets-cinnamon/light/misc"
ASSETS_DIR="../cinnamon/assets"
ASSETS_LIGHT_DIR="../cinnamon-light/assets"
ASSETS_DARK_DIR="../cinnamon-dark/assets"
KEY_FILE="../../gtk/sass/common/resources/_key_colors.scss"
THUMB="thumbnail"

# Default colours
selection1="`grep 'Indigo500' ../../gtk/sass/common/_colors.scss | \
                   cut -d' ' -f3`"

# Check and re-color SVG files
if [ -e $KEY_FILE ]; then
    selection2="`grep 'key_selection' $KEY_FILE | \
                 cut -d' ' -f2 | cut -d';' -f1`"
IFS=$'
'
    cp -f $SRC_DIR/$THUMB.svg.in $SRC_DIR/$THUMB.svg
    cp -f $SRC_LIGHT_DIR/$THUMB.svg.in $SRC_LIGHT_DIR/$THUMB.svg
    cp -f $SRC_DARK_DIR/$THUMB.svg.in $SRC_DARK_DIR/$THUMB.svg

    if [ $selection1 != $selection2 ]; then
        sed -i "s/$selection1/$selection2/gi" $SRC_DIR/$THUMB.svg
        sed -i "s/$selection1/$selection2/gi" $SRC_LIGHT_DIR/$THUMB.svg
        sed -i "s/$selection1/$selection2/gi" $SRC_DARK_DIR/$THUMB.svg
        echo $THUMB.svg is re-colored with $selection2.
    fi
fi

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
              $ink_export_option=$ASSETS_DIR/$THUMB.png \
              $SRC_DIR/$THUMB.svg \
              >/dev/null 2>>inkscape.log
    $INKSCAPE --export-dpi="$non_scale_dpi" \
              $ink_export_option=$ASSETS_LIGHT_DIR/$THUMB.png \
              $SRC_LIGHT_DIR/$THUMB.svg \
              >/dev/null 2>>inkscape.log
    $INKSCAPE --export-dpi="$non_scale_dpi" \
              $ink_export_option=$ASSETS_DARK_DIR/$THUMB.png \
              $SRC_DARK_DIR/$THUMB.svg \
              >/dev/null 2>>inkscape.log
}

# Generate PNG file
if [ -f $ASSETS_DIR/$THUMB.png ] && \
    [ $KEY_FILE -ot $ASSETS_DIR/$THUMB.png ]; then
    echo $ASSETS_DIR/$THUMB.png exists.
elif [ -f $ASSETS_DIR/$THUMB.png ] && \
    [ $KEY_FILE -nt $ASSETS_DIR/$THUMB.png ]; then
    echo Re-rendering $ASSETS_DIR/$THUMB.png
    echo Re-rendering $ASSETS_LIGHT_DIR/$THUMB.png
    echo Re-rendering $ASSETS_DARK_DIR/$THUMB.png
    echo $THUMB.png >>inkscape.log
    rm -f $ASSETS_DIR/$THUMB.png
    rm -f $ASSETS_LIGHT_DIR/$THUMB.png
    rm -f $ASSETS_DARK_DIR/$THUMB.png
    render-non-scale
else
    echo Rendering $ASSETS_DIR/$THUMB.png
    echo Rendering $ASSETS_LIGHT_DIR/$THUMB.png
    echo Rendering $ASSETS_DARK_DIR/$THUMB.png
    echo $THUMB.png >>inkscape.log
    render-non-scale
fi
