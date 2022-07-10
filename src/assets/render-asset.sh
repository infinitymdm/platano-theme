#! /bin/bash -x

if [ "$1" == "-h" ]; then
    echo "USAGE: $(basename "$0") ID SOURCE OUTDIR"
    echo "Render object ID from SOURCE to the file specified by OUTDIR"
    exit
fi

ID=$1
SRC_FILE=$2
OUTDIR=$3

inkscape --export-id=$ID \
         --export-dpi=96 \
         --export-id-only \
         --export-filename=$OUTDIR/$ID.png $SRC_FILE \

inkscape --export-id=$ID \
         --export-dpi=192 \
         --export-id-only \
         --export-filename=$OUTDIR/$ID@2.png $SRC_FILE \
