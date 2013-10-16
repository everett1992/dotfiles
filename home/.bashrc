#
# ~/.bashrc
#


# If not running interactively, don't do anything more
[[ $- != *i* ]] && return

shopt -s checkwinsize


parse_git_branch() { 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
 }

if [ -n "$SSH_CLIENT" ]; then
	hostname="\h "
fi

if [[ $EUID == 0 ]]; then
	root="\u "
fi

PS1="$root$hostname\[\033[00;32m\]\w\[\033[00m\]\[\e[01;33;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "


# load amazon credentials 
[[ -f "$HOME/.amazon_keys" ]] && source "$HOME/.amazon_keys";

# color aliases
alias ls='ls -h --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep -i --color=auto'
alias fgrep='fgrep -i --color=auto'
alias egrep='egrep -i --color=auto'

alias df='df -h'

alias nc='ncmpcpp'


# my aliases
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

export EDITOR="vim"
export BROWSER="chromium"


# your fortune is printed
# [[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune -s)\e[00m"

# a cow says your fortune
# [[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune -s | /usr/bin/cowsay)\e[00m"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
