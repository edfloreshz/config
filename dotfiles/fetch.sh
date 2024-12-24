#!/bin/sh

# Get the current configuration.

# Home directories
CONFIG=$HOME/.config 
ROFI=$CONFIG/rofi
POLYBAR=$CONFIG/polybar
LEFTWM=$CONFIG/leftwm 
WAYBAR=$CONFIG/waybar
SWAY=$CONFIG/sway
AWESOME=$CONFIG/awesome
FISH=$CONFIG/fish

# Repository directories
REPO=$(pwd)
REPO_CONFIG=$REPO/.config 
REPO_ROFI=$REPO_CONFIG/rofi
REPO_POLYBAR=$REPO_CONFIG/polybar
REPO_LEFTWM=$REPO_CONFIG/leftwm 
REPO_WAYBAR=$REPO_CONFIG/waybar
REPO_SWAY=$REPO_CONFIG/sway
REPO_AWESOME=$REPO_CONFIG/awesome
REPO_FISH=$REPO_CONFIG/fish

# Ensure folders are present
[ ! -d $REPO_CONFIG     ] && mkdir $REPO_CONFIG
[ ! -d $REPO_ROFI       ] && mkdir $REPO_ROFI
[ ! -d $REPO_POLYBAR    ] && mkdir $REPO_POLYBAR
[ ! -d $REPO_LEFTWM     ] && mkdir $REPO_LEFTWM
[ ! -d $REPO_WAYBAR     ] && mkdir $REPO_WAYBAR
[ ! -d $REPO_SWAY       ] && mkdir $REPO_SWAY
[ ! -d $REPO_AWESOME    ] && mkdir $REPO_AWESOME
[ ! -d $REPO_FISH       ] && mkdir $REPO_FISH

# Dotfiles 

## Get user dotfiles.
cp $HOME/{.gitconfig,.zshrc,.alacritty.toml,.bashrc,.vimrc,.xprofile,.tmux.conf} .
echo "Obtained dotfiles"

# Rofi
[ -d $ROFI ] && cp -r $ROFI $REPO_CONFIG

# Polybar
[ -d $POLYBAR ] && cp -r $POLYBAR/config $REPO_POLYBAR

# Leftwm
[ -d $LEFTWM ] && cp -r $LEFTWM/config.toml $REPO_LEFTWM

# Waybar

[ -d $WAYBAR ] && cp -r $WAYBAR/* $REPO_WAYBAR

# Sway

[ -d $SWAY ] && cp $SWAY/config $REPO_SWAY  

# Awesome WM

[ -d $AWESOME ] && cp -r $AWESOME/* $REPO_AWESOME

# Fish

[ -d $FISH ] && cp -r $FISH/* $REPO_FISH
