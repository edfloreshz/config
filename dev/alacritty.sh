#!/usr/bin/env bash

set -e

# Copy Alacritty config from dotfiles to home directory
curl -fsSL https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.alacritty.toml -o "$HOME/.alacritty.toml"
echo "Alacritty config copied to $HOME/.alacritty.toml"
