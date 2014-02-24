#------------------------------------------------------------------#
# File: ~/.zshrc                         zsh runtime configuration #
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
bindkey -v         # Use vi like key bindings
typeset -g -A key  # I forget. :(

bindkey '\e[7~' beginning-of-line # Home
bindkey ''    beginning-of-line # ctrl-a
bindkey '\e[8~' end-of-line       # End
bindkey ''    end-of-line       # ctrl-e

bindkey '^R' history-incremental-search-backward

bindkey "" backward-kill-line
bindkey "" yank


#------------------------------------------------------------------
# Aliass
#------------------------------------------------------------------

# Load general aliass
[[ -f ~/.aliasrc ]] && source ~/.aliasrc

# Zsh specific alias

# zsh _always_ trie to expand regexes to files
# so git ^HEAD, rake test[ok], nmap 192.168.*.* will cause issues.
alias rake='noglob rake'

#------------------------------------------------------------------
# Autocomplete configuration
#------------------------------------------------------------------
zstyle :compinstall filename "${HOME}/.zshrc"

autoload -Uz compinit
compinit -C

zstyle ':completion:*' completer _complete _ignored

# case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


#------------------------------------------------------------------
# Prompt
#------------------------------------------------------------------

setopt prompt_subst
autoload -U colors zsh/terminfo 
colors

# Needed to display git branch
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git*' actionformats "(±%b|%a)"
zstyle ':vcs_info:git*' formats "(±%b)"

precmd() { vcs_info }

# clear any terminal colors // remove '-n' to include a new line after each prompt, may be cool
preexec() { echo -n "$reset_color" }

# Display hostname in prompt if logged in through ssh
if [ -n "$SSH_CLIENT" ]; then
  hostname="%M "
fi

# Indicate what vi mode is active
vim_ins_mode="%{$fg[cyan]%}»%{$reset_color%}"
vim_nml_mode="%{$fg[blue]%}∷"
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
PROMPT='%{$fg[blue]%}$hostname%{$fg[magenta]%}%~%{$fg[cyan]%}${vcs_info_msg_0_} %{$reset_color%}${vim_mode} '

#------------------------------------------------------------------
# Man Colors
#------------------------------------------------------------------

export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

#------------------------------------------------------------------
# Cat Colors
#------------------------------------------------------------------

function ccat {
  for arg in "$@"; do
    pygmentize -g "${arg}" 2> /dev/null || /bin/cat "${arg}"
  done
}


# path loading
PATH="$PATH:$HOME/.bin"
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
