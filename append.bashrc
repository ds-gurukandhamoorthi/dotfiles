#!/bin/bash
PATH=$PATH:/home/guru/bin
PATH=$PATH:/home/guru/.cabal/bin
PATH=$PATH:/home/guru/.cargo/bin

export EDITOR='vim'
alias uml2png='java -jar /home/guru/Downloads/plantuml.jar'
alias minify='minify --no-comments'

alias cvlc='cvlc --play-and-exit --hotkeys-mousewheel-mode 1'
alias aria2c='aria2c --seed-time=0'
alias googler='googler -n 3 --noprompt'
alias g='googler'
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


#show you git status and branch (in color) at the command prompt
#https://coderwall.com/p/pn8f0g/show-your-git-status-and-branch-in-color-at-the-command-prompt
#Jake Romer
COLOR_RED="\033[0;31m"
COLOR_YELLOW="\033[0;33m"
COLOR_GREEN="\033[0;32m"
COLOR_OCHRE="\033[38;5;95m"
COLOR_BLUE="\033[0;34m"
COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"

function git_color {
		local git_status="$(git status 2> /dev/null)"

		if [[ ! $git_status =~ "working directory clean" ]]; then
				echo -e $COLOR_RED
		elif [[ $git_status =~ "Your branch is ahead of" ]]; then
				echo -e $COLOR_YELLOW
		elif [[ $git_status =~ "nothing to commit" ]]; then
				echo -e $COLOR_GREEN
		else
				echo -e $COLOR_OCHRE
		fi
}

function git_branch {
		local git_status="$(git status 2> /dev/null)"
		local on_branch="On branch ([^${IFS}]*)"
		local on_commit="HEAD detached at ([^${IFS}]*)"

		if [[ $git_status =~ $on_branch ]]; then
				local branch=${BASH_REMATCH[1]}
				echo "($branch)"
		elif [[ $git_status =~ $on_commit ]]; then
				local commit=${BASH_REMATCH[1]}
				echo "($commit)"
		fi
}

#PS1="\[$COLOR_WHITE\]\n[\W]"          # basename of pwd
PS1+="\[\$(git_color)\]"        # colors git status
PS1+="\$(git_branch)"           # prints current branch
PS1+="\[$COLOR_BLUE\]\$\[$COLOR_RESET\] "   # '#' for root, else '$'
export PS1

alias e='f -e vim'  


#disable ctrl-Q on terminal   to use unimpaired.vim plugin :cnfile
stty -ixon


function v(){
		FN="$(f -n1 $*)"
		case "$FN" in
				*pdf)
						zathura "$FN"
						;;
				*)      view "$FN"
						;;
		esac

}

export ANDROID_HOME=$HOME/Android/Sdk/
export PATH=$PATH:$ANDROID_HOME/tools
export JAVA_HOME=/opt/java/jdk1.8.0_131

export PATH=$PATH:/opt/gradle/gradle-4.0/bin/

complete -A file -X !*.@(mp4|mp3|mkv|avi|wav|mpg|webm) cvlc
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

alias rvlc='rvlc --one-instance --playlist-enqueue'

# To get 256 color support in lxterminal
if [ "$TERM" = "xterm" ]
then
    export TERM="xterm-256color"
fi

export PATH=$PATH:/opt/tmux/
source ~/.tmuxinator/tmuxinator.bash
