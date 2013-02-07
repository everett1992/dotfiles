#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
shopt -s checkwinsize


parse_git_branch() { 
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
 }

if [ -n "$SSH_CLIENT" ]; then
  PS1="\h \[\033[00;32m\]\w\[\033[00m\]\[\e[01;33;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "
else
  PS1="\[\033[00;32m\]\w\[\033[00m\]\[\e[01;33;49m\]\$(parse_git_branch)\[\e[0;0m\]$ "
fi

export EDITOR="vim"

# load amazon credentials 
if [[ -f "$HOME/.amazon_keys" ]]; then
  source "$HOME/.amazon_keys";
fi

# color aliases
alias ls='ls -h --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep -i --color=auto'
alias fgrep='fgrep -i --color=auto'
alias egrep='egrep -i --color=auto'

alias df='df -h'


# my aliases
alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"