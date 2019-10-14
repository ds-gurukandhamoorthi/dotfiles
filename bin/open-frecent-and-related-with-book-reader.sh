#!/bin/bash
PDF_VIEWER=mupdf
EPUB_VIEWER=fbreader
FILE=$(python3 /home/guru/bin/open-frecent-and-related.py --file-type-book)
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
