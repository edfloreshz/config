#!/usr/bin/env bash

set -e

# 1. Install fish shell
if ! command -v fish >/dev/null 2>&1; then
    echo "Installing fish shell..."
    if command -v apt-get >/dev/null 2>&1; then
        sudo apt-get update
        sudo apt-get install -y fish
    elif command -v brew >/dev/null 2>&1; then
        brew install fish
    else
        echo "Please install fish shell manually. (apt, brew, or your package manager)"
        exit 1
    fi
else
    echo "fish shell is already installed."
fi

# 2. Set fish as default shell
if [ "$SHELL" != "$(command -v fish)" ]; then
    echo "Setting fish as your default shell..."
    chsh -s "$(command -v fish)"
fi

# 3. Download config.fish from GitHub
echo "Configuring fish shell with your dotfiles"
fish
curl -fsSL https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.config/fish/config.fish -o "$HOME/.config/fish/config.fish"

echo "Fish shell installed and configured! Please restart your terminal."
