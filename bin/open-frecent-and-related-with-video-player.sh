#!/bin/bash
VIDEO_PLAYER=cvlc
FILE=$(python3 /home/guru/bin/open-frecent-and-related.py --file-type-video)
echo $FILE
if [ -n "$FILE" ]
then
    fasd -A "$FILE"
    $VIDEO_PLAYER "$FILE"
fi
