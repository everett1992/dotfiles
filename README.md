dotfiles
========

dotfile repository with install scripts


run `dot install` to create sym links to the files tracked by this repository

`locations` lists directories of files and where the symlink should be places.

```
home ~            # links files in ./home to the home directory
config ~/.config  # link files in config to ~/.config
```

`dot add [file]` will move the file to source directory if it is in the locations file

## TODO:
 - I'd like to directly support multiple systems. Some dotfiles should not be copied to other computers. I'd like
the configs to be tracked in git, but not synced to other computers.

 - Automatic git commits on `dot add`.

 - Option to add new directories to the locations file on `dot add`.

 - ec2, .ssh/config permissions get mis set

```
    ~/.wallpapers/.wallpapers
       ^-----------+
```
