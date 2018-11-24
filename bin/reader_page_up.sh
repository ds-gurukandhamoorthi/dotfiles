#!/bin/bash
ratpoison -c "select zathura"
sleep 0.08
# ratpoison -c "exec xdotool key --delay 500 Prior"
# ratpoison -c "exec xdotool key Prior"
/home/guru/bin/page_up.sh
ratpoison -c "focuslast"
