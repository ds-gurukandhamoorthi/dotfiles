DIREC='.'
#FILE=$(/home/guru/bin/relevantFiles.sh "$DIREC"| sed -e "s:${DIREC}::"| dmenu  -i -l 3)
FILE=$(ls | dmenu -i -l 3) 
echo $FILE
if [ -n "$FILE" ]
then
	# cvlc --play-and-exit --hotkeys-mousewheel-mode 1 --key-audio-track "None" --key-play-pause 'b' --key-jump-short "Page Up" --key-jump+short "Page Down" "$FILE"
	cvlc --play-and-exit --hotkeys-mousewheel-mode 1\
        --key-intf-popup-menu "None" --key-frame-next "Menu"\
        --key-nav-activate "None" --key-play-pause 'Enter' \
        --key-nav-left "None" --key-jump-extrashort "Left" \
        --key-nav-right "None" --key-jump+extrashort "Right" \
        --key-jump-short "Page Up" \
        --key-jump+short "Page Down"\
        "$FILE"
fi

