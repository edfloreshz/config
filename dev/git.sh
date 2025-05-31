#!/usr/bin/env bash

set -e

curl -fsSL https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/.gitconfig -o "$HOME/.gitconfig"
echo ".gitconfig copied to $HOME/.gitconfig"

# Install the GitHub CLI and login, add if checks for apt, dnf and brew
if ! command -v gh >/dev/null 2>&1; then
    echo "Installing GitHub CLI..."
    if command -v apt >/dev/null 2>&1; then
        sudo apt install gh >/dev/null 2>&1
    elif command -v dnf >/dev/null 2>&1; then
        sudo dnf install gh >/dev/null 2>&1
    elif command -v brew >/dev/null 2>&1; then
        brew install gh >/dev/null 2>&1
    else
        echo "Package manager not found."
        exit 1
    fi
    echo "GitHub CLI installed."
    echo "Logging into GitHub..."
    gh auth login
fi
