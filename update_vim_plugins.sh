DIREC=~/.vim/pack/git-plugins/start
cd "$DIREC"
for i in $(find "$DIREC" -maxdepth 2 -iname '.git'); do
    echo "$i"
    cd "$i/.."
    git pull
    cd "$DIREC"
done
