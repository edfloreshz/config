# Arch Linux Configuration Script
# Author: Eduardo Flores <edfloreshz@gmail.com>


# Check if running from Arch based distro.
if [[ ! $(which pacman) ]];
then
  echo "This script is designed for Arch based distros."
  exit
fi

# Arch update
#echo "Checking for updates..."
#if [[ $(checkupdates) ]];
#then
#    echo "Updates found, updating..."
#    sudo pacman -Syu --noconfirm
#    echo "System updated."
#else
#    echo "System already up to date."
#fi

# Paru installation
if ! command -v paru &>/dev/null
then
    sudo pacman -S --needed --noconfirm base-devel git
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si
    cd ..
    rm -rf paru
else
    echo "Paru is already installed."
fi

# Zsh and Ohmyzsh installation
if [ ! -d $HOME/.oh-my-zsh ]
then
    paru -S zsh --needed --noconfirm
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Ohmyzsh is already installed."
fi

# Zsh configuration
cd $HOME
if [[ ! $( cat $HOME/.zshrc | grep gcl ) ]];
then
    curl -L https://raw.githubusercontent.com/edfloreshz/dotsy/main/scripts/.zshrc > .zshrc
else
    echo "Zsh is already configured."
fi

# Developer tools
hash go clang cmake rustc && echo "Developer tools already installed." ||
if [ $( paru -S go clang cmake --needed --noconfirm &>/dev/null ) ];
then
  echo "Installing Rust..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  echo "Installed developer tools."
else
  echo "Some developer tools failed to install."
fi


# Vim configuration
cd $HOME

if [ ! -d $HOME/.vim/autoload ];
then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    curl -L https://raw.githubusercontent.com/edfloreshz/vimconfig/main/.vimrc > .vimrc
else
    echo "VimPlug is already installed."
fi
if [ ! -d $HOME/.vim/plugged ]
then
    vim +PlugInstall +qall
    cd ~/.vim/plugged/youcompleteme
    ./install.py --clang-completer --system-libclang --rust-completer --go-completer
else
    echo "Vim plugins are already installed"
fi

# Packages installation
echo "Installing packages..."
hash telegram-desktop jetbrains-toolbox cmake code discord timeshift spotify && echo "All programs installed" ||
if [[ $( paru -S telegram-desktop jetbrains-toolbox cmake visual-studio-code-bin discord timeshift spotify --needed --noconfirm &>/dev/null ) ]];
then
    echo "All programs have been installed."
else
    echo "Some programs were omitted or not installed.."
fi