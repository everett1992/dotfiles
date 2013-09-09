#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired configs in ~/configs
############################

########## Variables

dir=~/configs                    # configs directory
olddir=~/.configs_old             # old configs backup directory

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

# create configs_old in homedir
if [ ! -e "$olddir" ]; then
  echo "Creating $olddir for backup of any existing configs in ~"
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


    if [[ "`readlink "$link"`" != "$real" ]]; then
      if [[ ! -e "$link" ]]; then
        echo "Creating $file"
      elif [[ -h "$link" ]]; then
        echo "Updating $file"
      fi
      indent "$link -> $real"
      ln -sf $real $link
    fi
  done
done
