#!/bin/bash
ratpoison -c "select zathura"
sleep 0.08
# ratpoison -c "exec xdotool key Next"
/home/guru/bin/page_down.sh
ratpoison -c "focuslast"
