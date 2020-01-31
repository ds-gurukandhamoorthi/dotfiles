#!/bin/bash
PDF_VIEWER=mupdf
EPUB_VIEWER=fbreader
FILE=$(/home/guru/bin/open-enhanced book)
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
