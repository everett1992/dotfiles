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

# Load general aliass
[[ -f ~/.aliasrc ]] && source ~/.aliasrc


export EDITOR="vim"
export BROWSER="chromium"


# your fortune is printed
# [[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune -s)\e[00m"

# a cow says your fortune
# [[ "$PS1" ]] && echo -e "\e[00;33m$(/usr/bin/fortune -s | /usr/bin/cowsay)\e[00m"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
