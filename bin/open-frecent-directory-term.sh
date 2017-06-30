#!/bin/bash
FRECENT_DIREC=$(fasd -d -n1)
echo "$FRECENT_DIREC"
lxterminal --working-directory="$FRECENT_DIREC"
