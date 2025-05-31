#!/usr/bin/env bash

set -e

# Check if hx is already installed
if command -v hx >/dev/null 2>&1; then
    echo "Helix (hx) is already installed."
    exit 0
else
    # Fetch the latest Helix release tag from GitHub
    LATEST_TAG=$(curl -s https://api.github.com/repos/helix-editor/helix/releases/latest | grep tag_name | cut -d '"' -f 4)
    echo "Latest Helix version: $LATEST_TAG"

    # Construct download URL
    TARBALL="helix-${LATEST_TAG}-x86_64-linux.tar.xz"
    DOWNLOAD_URL="https://github.com/helix-editor/helix/releases/download/${LATEST_TAG}/${TARBALL}"

    echo "Downloading Helix from $DOWNLOAD_URL..."
    curl -LO "$DOWNLOAD_URL"

    echo "Extracting Helix to /usr/local/helix..."
    sudo rm -rf /usr/local/helix
    sudo mkdir -p /usr/local/helix
    sudo tar -xf "$TARBALL" -C /usr/local/helix --strip-components=1

    echo "Cleaning up tarball..."
    rm "$TARBALL"
fi

# Add Helix to PATH in .profile
if ! grep -q 'export PATH=$PATH:/usr/local/helix' ~/.profile; then
  echo 'export PATH=$PATH:/usr/local/helix' >> ~/.profile
fi

# Add Helix to PATH in fish config
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    if ! grep -q '/usr/local/helix' "$FISH_CONFIG"; then
        echo 'set -U fish_user_paths /usr/local/helix $fish_user_paths' >> "$FISH_CONFIG"
        echo "Helix path added to $FISH_CONFIG."
    fi
else
    mkdir -p "$(dirname "$FISH_CONFIG")"
    echo 'set -U fish_user_paths /usr/local/helix $fish_user_paths' >> "$FISH_CONFIG"
    echo "Created $FISH_CONFIG and added Helix path."
fi

echo "Helix installation complete. Please restart your terminal or run 'source ~/.profile' or 'source ~/.config/fish/config.fish' to update your PATH."
