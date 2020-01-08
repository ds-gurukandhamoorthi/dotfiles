#!/bin/bash
VID_PLAYER=cvlc --play-and-exit --hotkeys-mousewheel-mode 1\
        --key-intf-popup-menu "None" --key-frame-next "Menu"\
        --key-nav-activate "None" --key-play-pause 'Enter' \
        --key-nav-left "None" --key-jump-extrashort "Left" \
        --key-nav-right "None" --key-jump+extrashort "Right" \
        --key-jump-short "Page Up" \
        --key-jump+short "Page Down"
AUD_PLAYER=rvlc --play-and-exit
#FIXME: append list all open directory files, and all relevant files too... so that we can have it all in one place...
FILE=$(fasd -lRf |grep "\.mp4$\|\.mkv\|\.mp3$" | dmenu -i -f -l 3)
echo $FILE
if [ -n "$FILE" ]
then
    if [[ $FILE == *mp3 ]] 
    then
        # $AUD_PLAYER "$FILE"
        #FIXME: pgrep vlc to find if there's already an instance. In that case merely add the mp3
        ESC_FILE="$FILE"
        urxvt -e bash -c "rvlc '$FILE'"
    else 
        cvlc --play-and-exit --hotkeys-mousewheel-mode 1\
        --key-intf-popup-menu "None" --key-frame-next "Menu"\
        --key-nav-activate "None" --key-play-pause 'Enter' \
        --key-nav-left "None" --key-jump-extrashort "Left" \
        --key-nav-right "None" --key-jump+extrashort "Right" \
        --key-jump-short "Page Up" \
        --key-jump+short "Page Down"\
        "$FILE"
        #$VID_PLAYER "$FILE"
    fi
fi
