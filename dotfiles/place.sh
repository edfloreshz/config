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
    6 "Git"
    7 "Fish"
)

while CHOICE=$(dialog --clear --backtitle "$BACKTITLE" --title "$TITLE" \
        --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" \
        2>&1 >/dev/tty)
clear
do
    case $CHOICE in
        1)
            echo "Placing alacritty files..."
            curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.alacritty.yml > $HOME/.alacritty.yml
            echo "Alacritty files placed in $HOME/.alacritty.yml"
            ;;
        2)
            echo "Placing bash files"
            curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.bashrc > $HOME/.bashrc
            echo "Bash files placed in $HOME/.bashrc"
            ;;
        3)
            echo "Placing zsh files"
	    curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.zshrc > $HOME/.zshrc
            echo "Zsh files placed in $HOME/.zshrc"
            ;;
        4)
            echo "Placing vim files"
	    curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.vimrc > $HOME/.vimrc
            echo "Vim files placed in $HOME/.vimrc"
            ;;
        5)
            echo "Placing xprofile"
	    curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.xprofile > $HOME/.xprofile
            echo "Xprofile placed in $HOME/.xprofile"
            ;;
        6)
            echo "Placing git configuration files"
	    curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.gitconfig > $HOME/.gitconfig
            echo "Git config file placed in $HOME/.gitconfig"
            ;;
        
        7)
	    echo "Placing fish configuration files"
	    curl -L https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.config/fish/config.fish > $HOME/.config/fish/config.fish
	    echo "Fish config placed in $CONFIG/fish"
	    ;;
        *)
            break
            ;;
    esac
    read -s -n 1 -p "Press any key to continue..."
done

