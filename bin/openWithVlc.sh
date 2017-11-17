DIREC='.'
#FILE=$(/home/guru/bin/relevantFiles.sh "$DIREC"| sed -e "s:${DIREC}::"| dmenu  -i -l 3)
FILE=$(ls | dmenu -i -l 3) 
echo $FILE
if [ -n "$FILE" ]
then
	cvlc "$FILE"
fi

