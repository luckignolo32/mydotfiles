# My dotfiles

My dotfiles on my Arch Linux machine running Hyprland. 

## How to install

Only tested on Arch Linux with hyprland 0.50.1 and above; in order to configure a dotfile, you will need [stow](https://github.com/aspiers/stow) and the program itself already installed. Here are all the steps:
1) delete/rename your original configuration file(s), even if it's an entire folder. That's crucial.
2) clone this repo. Make sure to do it in your home directory.
3) simply type `stow "path/to/the/folder"`. Make sure that the path only points to the outer layer of the dotfile (for example, for hyprland config the command will be `stow <repo>/hyprland`).

This will create **symlinks** to the repo files, replacing the actual configuration files. Yes,you'll need to keep the repo; dont't worry, it's very light (at the moment).
