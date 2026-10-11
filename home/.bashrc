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


# loadcredentials
[[ -f "$HOME/.keys" ]] && source "$HOME/.keys";

# Load general aliass
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
