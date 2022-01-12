#!/bin/bash

OPTIONS=$(zenity --forms --title="Pdf Stamp" --separator="," --text="Add a signature" \
   --add-entry="Page Number" \
   --add-entry="Distance from bottom" \
   --add-entry="Distance from left");
   
INPUT=$(zenity --file-selection \
       --width 500 \
       --title "Input file" \
       --text ""); 

SIGNATURE=$(zenity --file-selection \
       --width 500 \
       --title "Signature file" \
       --text ""); 

PAGE=$(awk -F, '{print $1}' <<<$OPTIONS)
BOTTOM=$(awk -F, '{print $2}' <<<$OPTIONS)
LEFT=$(awk -F, '{print $3}' <<<$OPTIONS)

pdfstamp stamp --input $INPUT --signature $SIGNATURE --output $INPUT.signed.pdf --page $PAGE --bottom $BOTTOM --left $LEFT

