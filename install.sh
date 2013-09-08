#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory

declare -A locations
locations=(
  ["home"]=~
  ["config"]=~/.config
)

########## Functions

function indent {
  echo ":: $@"
}

##########

# create dotfiles_old in homedir
if [ ! -e "$olddir" ]; then
  echo "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
  echo "...done"
fi

cd $dir


for source in "${!locations[@]}"; do
  dest=${locations["$source"]}
  echo "Linking files in $source to $dest"
  for file in `ls -A $source`; do
    link="$dest/$file"
    real="$dir/$source/$file"

    # Back up existing files if they exist
    if [[ -e $link ]] && [[ ! -h $link ]]; then
      echo "Backing up $file"
      mv $link $olddir/$source/$file
    fi

    if [[ ! -e $link ]]; then
      echo "Creating $file"
    elif[[ -h $link ]]
      echo "Updating $file"
    fi

    if [[ "`readlink "$link"`" != "$real" ]]; then
      indent "$link -> $real"
      ln -sf $real $link
    fi
  done
done
