#!/bin/bash -e
############################
# .make.sh
# This script creates symlinks from the home directory to any desired configs in ~/configs
############################

########## Variables

dir=$(readlink -f `dirname $0`)             # Change this to the location of this script
olddir=${dir}_old             # old configs backup directory

locations="$dir/locations"

########## Functions

function indent {
  echo ":: $@"
}

##########

# create configs_old in homedir
cat $locations | while read line; do
  set -- $line
  backup=$olddir/$1

  if [ ! -e "$backup" ]; then
    echo "Creating $backup for backup of any existing configs in ~"
    mkdir -p $backup
  fi
done
echo "...done"

echo $dir
cd $dir

cat $locations | while read line; do
  # Must be a way to simplify these three lines
  set -- $line
  source=$1
  dest=$(eval echo $2)

  echo "Linking files in '$source' to '$dest'"
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
