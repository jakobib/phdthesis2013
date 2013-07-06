#!/bin/bash
set -e

INPUT=$1
WIDTH=$2
HEIGHT=$3

# A4 (pt * 100)
WIDTH=59528
HEIGHT=84189

# A5 (pt * 100)
WIDTH=42095
HEIGHT=59530

OLDWIDTH=`podofopdfinfo $INPUT | awk '/Page Size/ { print $3 }'`
OLDHEIGHT=`podofopdfinfo $INPUT | awk '/Page Size/ { print $5 }'`

echo "cropping $1 to from $OLDWIDTH x $OLDHEIGHT to $WIDTH x $HEIGHT pt"

pdftk $INPUT cat 1-endeven output even-$INPUT
pdftk $INPUT cat 1-endodd  output odd-$INPUT

ODDLEFT=4900
EVENLEFT=13000
BOTTOM=15000

podofobox even-$INPUT even-crop.pdf media $EVENLEFT $BOTTOM $WIDTH $HEIGHT
podofobox odd-$INPUT  odd-crop.pdf media $ODDLEFT $BOTTOM $WIDTH $HEIGHT

pdftk A=odd-crop.pdf B=even-crop.pdf shuffle A B output cropped-$INPUT
