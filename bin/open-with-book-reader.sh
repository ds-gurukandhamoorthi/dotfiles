#!/bin/bash
PDF_VIEWER=mupdf
EPUB_VIEWER=fbreader
FILE=$(fasd -lRf |grep "\.epub$\|\.pdf$" | dmenu -i -l 3) 
echo $FILE
if [ -n "$FILE" ]
then
    if [[ $FILE == *pdf ]] 
    then
        $PDF_VIEWER "$FILE"
    elif [[ $FILE == *epub ]]
    then
        $EPUB_VIEWER "$FILE"
    fi
fi
