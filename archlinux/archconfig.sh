# Arch Linux Configuration Script
# Author: Eduardo Flores <edfloreshz@gmail.com>

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=4
BACKTITLE="Arch Linux Configuration Script"
TITLE="Configuration Script"
MENU="Select an option..."

OPTIONS=(
    1 "Install Paru"
    2 "Configure Zsh"
    3 "Configure Vim"
    4 "Install developer tools"
    5 "Install programs"
    6 "Place dotfiles"
)

while CHOICE=$(dialog --clear --backtitle "$BACKTITLE" --title "$TITLE" \
        --menu "$MENU" $HEIGHT $WIDTH $CHOICE_HEIGHT "${OPTIONS[@]}" \
        2>&1 >/dev/tty)
clear
do
    case $CHOICE in
        1) # Paru installation
            if ! type paru 2>&1 1>/dev/null
            then
                sudo pacman -S --needed --noconfirm base-devel git
                git clone https://aur.archlinux.org/paru.git
                cd paru
                makepkg -si
                cd ..
                rm -rf paru
                echo "Paru installed"
            else
                echo "Paru is already installed."
            fi
            ;;
        2) # Zsh installation and configuration
            hash zsh &>/dev/null && echo "Zsh installed." || paru -S zsh --needed --noconfirm &>/dev/null  
            # Ohmyzsh configuration
            if [ ! -d $HOME/.oh-my-zsh ]
            then
                sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                echo "Ohmyzsh installed"
            else
                echo "Ohmyzsh is already installed."
            fi
            # Zsh configuration
            cd $HOME
            if [[ ! $( cat $HOME/.zshrc | grep gcl ) ]];
            then
                curl -L https://raw.githubusercontent.com/edfloreshz/dotfiles/main/.zshrc > .zshrc
                    echo "Zsh configured"
                else
                    echo "Zsh is already configured."
            fi
            ;;
        3) # Install and configure Vim
            hash vim &>/dev/null && echo "Vim installed" || paru -S vim --needed --noconfirm &>/dev/null
            cd $HOME
            if [ ! -d $HOME/.vim/autoload ];
            then
                curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            else
                echo "VimPlug is already installed."
            fi

            curl -L https://raw.githubusercontent.com/edfloreshz/dotfiles/main/.vimrc > .vimrc
            if [ ! -d $HOME/.vim/plugged ]
            then
                vim +PlugInstall +qall
                cd ~/.vim/plugged/youcompleteme
                ./install.py --clang-completer --system-libclang --rust-completer --go-completer
            else
                echo "Vim plugins are already installed"
            fi
            ;;
        4) # Install developer tools
            hash go &>/dev/null && echo "Go is already installed" || paru -S go --noconfirm
            hash clang &>/dev/null && echo "Clang is already installed" || paru -S clang --noconfirm
            hash cmake &>/dev/null && echo "Cmake is already installed" || paru -S cmake --noconfirm
            hash cargo && echo "Rust is already installed" || curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
            ;;
        5) # Install programs
            hash telegram-desktop jetbrains-toolbox code discord &>/dev/null && echo "All programs installed" || paru -S telegram-desktop jetbrains-toolbox cmake visual-studio-code-bin discord --needed
            ;;
        6) # Place dotfiles
            git clone https://github.com/edfloreshz/dotfiles
            cd dotfiles
            chmod 755 place.sh 
            ./place.sh 
            cd .. && rm -rf dotfiles
            ;;
        *)
            break
            ;;
    esac
    read -s -n 1 -p "Press any key to continue..."
done
