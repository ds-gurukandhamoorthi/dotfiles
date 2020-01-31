#!/bin/bash
FILE=$(/home/guru/bin/open-enhanced video)
echo $FILE
if [ -n "$FILE" ]
then
    fasd -A "$FILE"
    cvlc --play-and-exit --hotkeys-mousewheel-mode 1\
        --key-intf-popup-menu "None" --key-frame-next "Menu"\
        --key-nav-activate "None" --key-play-pause 'Enter' \
        --key-nav-left "None" --key-jump-extrashort "Left" \
        --key-nav-right "None" --key-jump+extrashort "Right" \
        --key-jump-short "Up" \
        --key-jump+short "Down"\
        --key-zoom "None"\
        --key-aspect-ratio "None"\
        --key-crop "None"\
        --video-title "$_"\
        "$FILE"
fi
