#!/bin/bash
set -e

INPUT=$1
WIDTH=$2
HEIGHT=$3

# A5 (pt * 100)
WIDTH=42095
HEIGHT=59530

# A4 (pt * 100)
WIDTH=59528
HEIGHT=84189

OLDWIDTH=`podofopdfinfo $INPUT | awk '/Page Size/ { print $3 }' | sed s/\\\\.//`
OLDHEIGHT=`podofopdfinfo $INPUT | awk '/Page Size/ { print $5 }' | sed s/\\\\.//`

echo "cropping $1 to from $OLDWIDTH x $OLDHEIGHT to $WIDTH x $HEIGHT pt/100"

#ODDLEFT=4900
#EVENLEFT=13000
#BOTTOM=15000

# 9mm
BCOR=2550
DIV=15
#ODDLEFT=$(( ($OLDWIDTH-$BCOR)/$DIV + $BCOR )) # crop
#EVENLEFT=$(( ($OLDWIDTH-$BCOR)/$DIV*2 ))

ODDLEFT=$(( -($WIDTH-$OLDWIDTH)/3 ))
EVENLEFT=$(( -($WIDTH-$OLDWIDTH)*2/3 ))
BOTTOM=$(( ($OLDHEIGHT - $HEIGHT) * 2 / 3))

echo "ODD: $ODDLEFT EVEN: $EVENLEFT BOTTOM: $BOTTOM"

pdftk $INPUT cat 1-endeven output even-$INPUT
pdftk $INPUT cat 1-endodd  output odd-$INPUT

podofobox even-$INPUT even-crop.pdf media $EVENLEFT $BOTTOM $WIDTH $HEIGHT
podofobox odd-$INPUT  odd-crop.pdf media $ODDLEFT $BOTTOM $WIDTH $HEIGHT

pdftk A=odd-crop.pdf B=even-crop.pdf shuffle A B output cropped-$INPUT

rm odd-crop-pdf even-crop-pdf

