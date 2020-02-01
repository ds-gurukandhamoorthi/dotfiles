#!/bin/bash
PATH=$PATH:/home/guru/bin
PATH=$PATH:/home/guru/.cabal/bin
PATH=$PATH:/home/guru/.cargo/bin

export EDITOR='vim'
alias uml2png='java -jar /home/guru/Downloads/plantuml.jar'
alias minify='minify --no-comments'

#alias cvlc='cvlc --play-and-exit --hotkeys-mousewheel-mode 1'
alias cvlc='cvlc --play-and-exit --hotkeys-mousewheel-mode 1\
        --key-intf-popup-menu "None" --key-frame-next "Menu"\
        --key-nav-activate "None" --key-play-pause 'Enter' \
        --key-nav-left "None" --key-jump-extrashort "Left" \
        --key-nav-right "None" --key-jump+extrashort "Right" \
        --key-jump-short "Up" \
        --key-jump+short "Down"\
        --key-zoom "None"\
        --key-aspect-ratio "None"\
        --key-crop "None"'
alias aria2c='aria2c --seed-time=0'
alias googler='googler -n 3 --noprompt'
alias g='googler -l en'
#update-alternative used ...
#alias node='/usr/local/bin/node'
#alias n='/usr/local/bin/n'
#alias npm='/usr/local/bin/npm'
alias nodejs='node'
alias js='node'

shopt -s globstar

eval "$(fasd --init auto)"
alias l='ls -ltr'
alias m='f -e '\''cvlc --play-and-exit'\'' '


PS1+="\$(where-am-i-git)"           # prints current branch in color using compiled rust program
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1

# alias e='f -e vim'
e ()
{
    vim "$(orfalgen-file echo "$@")"
}
#edit here in this directory and its descendants
alias e.='e ~+'
unalias z
z ()
{
    cd "$(orfalgen-dir echo "$@")"
}

#disable ctrl-Q on terminal   to use unimpaired.vim plugin :cnfile
stty -ixon


function v(){
		FN="$(orfalgen-file echo $*)"
		case "$FN" in
				*pdf)
						zathura "$FN"
						;;
				*)      view "$FN"
						;;
		esac

}
alias v.='v ~+'

export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools
export JAVA_HOME=/opt/java/jdk1.8.0_131

export PATH=$PATH:/opt/gradle/gradle-4.0/bin/

complete -A file -X !*.@(mp4|mkv|avi|wav|mpg|webm) cvlc
complete -A file -X !*.@(mp3|opus) rvlc
complete -o plusdirs -A file -X !*.@(epub) fbreader

alias gzip='pigz'  
alias gunzip='unpigz'  

alias cloc='/usr/local/bin/cloc'

function emulator { cd "$(dirname "$(which emulator)")" && ./emulator "$@"; }

alias em='emulator -avd test -use-system-libs'
alias python='python3.6 -q'
alias ipython='ipython3 --no-confirm-exit'
alias bc='bc -ql'

alias cal='cal -NMC'

export PYTHONSTARTUP=$HOME/.pythonrc
alias cclip='xclip -sel clip'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='ag -g ""'
export PYTHONHASHSEED=0
alias u='unicode'
man() {
    LESS_TERMCAP_md=$'\e[01;31m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[01;44;33m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[01;32m' \
    command man "$@"
}
export PATH=$PATH:/opt/geckodriver/
export PATH=$PATH:/opt/chromedriver/
export PATH=$PATH:/home/guru/progs/tup/
alias tidy='tidy -q'
source /home/guru/GURU_API.sh
export PATH=$PATH:/opt/gdrive/

#one can use /dev/null but it raises an error
alias xpdf='zathura -d /tmp/$(date +zathura_remember_me_not%s%N)'

alias rvlc='rvlc --one-instance --playlist-enqueue --play-and-exit'

# To get 256 color support in lxterminal
if [ "$TERM" = "xterm" ]
then
    export TERM="xterm-256color"
fi

export PATH=$PATH:/opt/tmux/
source ~/.tmuxinator/tmuxinator.bash

alias R='R --silent --vanilla'
alias youtube-dl='/opt/youtube-dl/youtube-dl'
alias sqlite=sqlite3
alias exa='/opt/exa/exa-linux-x86_64'
alias loc='/opt/loc/loc'
alias vmtouch='/opt/vmtouch/vmtouch'
export PATH=$PATH:/home/guru/devflutter/flutter/bin/
