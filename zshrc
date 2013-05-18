#------------------------------------------------------------------#
# File: .zshrc                           zsh runtime configuration #
# Author: Caleb Everett                                            #
#------------------------------------------------------------------#

#------------------------------------------------------------------
# History
#------------------------------------------------------------------
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000


#------------------------------------------------------------------
# Variables
#------------------------------------------------------------------

export BROWSER='chrome'
export EDITOR='vim'

#------------------------------------------------------------------
# Keybindings
#------------------------------------------------------------------
bindkey -v
typeset -g -A key
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^?' backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[3~' delete-char
bindkey '^[[4~' end-of-line
bindkey '^[[6~' down-line-or-history
bindkey '^[[A' up-line-or-search
bindkey '^[[D' backward-char
bindkey '^[[B' down-line-or-search
bindkey '^[[C' forward-char 

# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line


#------------------------------------------------------------------
# Aliass
#------------------------------------------------------------------
alias ls='ls -h --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep -i --color=auto'
alias fgrep='fgrep -i --color=auto'
alias egrep='egrep -i --color=auto'

alias df='df -h'

alias nc='ncmpcpp'

alias reboot="systemctl reboot"
alias shutdown="systemctl poweroff"
alias suspend="systemctl suspend"

#------------------------------------------------------------------
# Autocomplete configuration
#------------------------------------------------------------------
zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit

setopt BASH_AUTO_LIST

# Extend Globing
setopt autocd extendedglob

#------------------------------------------------------------------
# Prompt
#------------------------------------------------------------------

setopt prompt_subst
autoload -U colors zsh/terminfo 
colors

# Needed to display git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' formats "(±%b)"
precmd() { vcs_info }

# Display hostname if logged in remotely
if [ -n "$SSH_CLIENT" ]; then
	hostname="%M "
fi

# Indicate what vi mode is active
vim_ins_mode="%{$fg[cyan]%}[INS]%{$reset_color%}"
vim_nml_mode="%{$fg[blue]%}[NML]%{$reset_color%}"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_nml_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

# Multiline prompt with git and vi mode
#PROMPT='┌─${vim_mode} $fg[green]%n@%M$reset_color
#└ $fg[magenta]%~$fg[cyan]${vcs_info_msg_0_}$reset_color$ '

# Single Line prompt with git and vi mode
PROMPT='${vim_mode} %{$fg[blue]%}$hostname%{$fg[magenta]%}%~%{$fg[cyan]%}${vcs_info_msg_0_} %{$reset_color%}%# '
