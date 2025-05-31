#!/usr/bin/env bash

set -e

echo "Checking if Rust is already installed..."

if command -v cargo >/dev/null 2>&1; then
    echo "Rust is already installed at: $(command -v cargo)"
else
    echo "Rust not found. Installing Rust using rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    echo "Rust installation complete."
fi

# Add cargo bin to PATH in fish shell
FISH_CONFIG="$HOME/.config/fish/config.fish"
mkdir -p "$(dirname "$FISH_CONFIG")"
if ! grep -q '.cargo/bin' "$FISH_CONFIG" 2>/dev/null; then
    echo 'set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths' >> "$FISH_CONFIG"
    echo "Added ~/.cargo/bin to PATH in $FISH_CONFIG"
fi
