DIREC=~/.vim/pack/git-plugins/start
cd "$DIREC"
for i in $(ls -d */); do
    echo "$i"
    cd "$i"
    git pull
    cd "$DIREC"
done
