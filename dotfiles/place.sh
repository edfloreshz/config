#!/bin/sh

# This script copies the dotfiles from the repository to the user home folder.

# Home directories
CONFIG=$HOME/.config
ROFI=$CONFIG/rofi/
POLYBAR=$CONFIG/polybar/
LEFTWM=$CONFIG/leftwm/
WAYBAR=$CONFIG/waybar/
TMUX=$HOME/.tmux.conf
SWAY=$CONFIG/sway/
AWESOME=$CONFIG/awesomei/
# Ensure folders are present
[ ! -d $CONFIG  ] && mkdir $CONFIG
[ ! -d $ROFI    ] && mkdir $ROFI
[ ! -d $POLYBAR ] && mkdir $POLYBAR
[ ! -d $LEFTWM  ] && mkdir $LEFTWM
[ ! -d $WAYBAR  ] && mkdir $WAYBAR
[ ! -d $SWAY    ] && mkdir $SWAY
[ ! -d $AWESOME ] && mkdir $AWESOME

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Dotfiles Selector"
TITLE="Dotfiles Selector"
MENU="Pick which dotfiles to place in your system..."

OPTIONS=(
    1 "Alacritty"
    2 "Bash"
    3 "Zsh"
    4 "Vim"
    5 "Xprofile"
    6 "Rofi"
    7 "Polybar"
    8 "Waybar"
    9 "LeftWM"
    10 "Sway"
    11 "Awesome"
    12 "Git"
    13 "Fish"
)

while CHOICE=$(dialog --clear --backtitle "$BACKTITLE" --title "$TITLE" \
        --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" \
        2>&1 >/dev/tty)
clear
do
    case $CHOICE in
        1)
            echo "Placing alacritty files..."
            cp .alacritty.yml $HOME
            echo "Alacritty files placed in $HOME/.alacritty.yml"
            ;;
        2)
            echo "Placing bash files"
            cp .bashrc $HOME
            echo "Bash files placed in $HOME/.bashrc"
            ;;
        3)
            echo "Placing zsh files"
            cp .zshrc $HOME
            echo "Zsh files placed in $HOME/.zshrc"
            ;;
        4)
            echo "Placing vim files"
            cp .vimrc $HOME
            echo "Vim files placed in $HOME/.vimrc"
            ;;
        5)
            echo "Placing xprofile"
            cp .xprofile $HOME
            echo "Xprofile placed in $HOME/.xprofile"
            ;;
        6)
            echo "Placing rofi files"
            cp -r .config/rofi/* $ROFI
            echo "Rofi files placed in $ROFI"
            ;;
        7)
            echo "Placing polybar files"
            cp -r .config/polybar/* $POLYBAR
            echo "Polybar files placed in $POLYBAR"
            ;;
        8)
            echo "Placing waybar files"
            cp -r .config/polybar/* $WAYBAR 
            echo "Waybar files placed in $WAYBAR"
            ;;
        9)
            echo "Placing left window manager files"
            cp -r .config/leftwm/* $LEFTWM 
            echo "LeftWM files placed in $LEFTWM"
            ;;
        10)
            echo "Placing sway window manager files"
            cp -r .config/sway/* $SWAY 
            echo "SwayWM files placed in $SWAY"
            ;;
        11)
            echo "Placing awesome window manager files"
            cp -r .config/awesome/* $AWESOME 
            echo "awesomeWM files placed in $AWESOME"
            ;;
        12)
            echo "Placing git configuration files"
            cp .gitconfig $HOME
            echo "Git config file placed in $HOME/.gitconfig"
            ;;
        
        13)
	    echo "Placing fish configuration files"
	    cp -r .config/fish $CONFIG
	    echo "Fish config placed in $CONFIG/fish"
	    ;;
        *)
            break
            ;;
    esac
    read -s -n 1 -p "Press any key to continue..."
done

