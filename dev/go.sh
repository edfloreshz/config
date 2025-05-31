#!/usr/bin/env bash

set -e

# Fetch the latest version number
LATEST_VERSION=$(curl -s https://go.dev/VERSION?m=text | head -n 1)
LATEST_VERSION_NUMBER=${LATEST_VERSION#go}

# Check if Go is already installed
if command -v go >/dev/null 2>&1; then
    INSTALLED_VERSION=$(go version | awk '{print $3}' | sed 's/go//')
    echo "Go is already installed: version $INSTALLED_VERSION"
    exit 0
else
    echo "Go is not installed. Proceeding with installation of $LATEST_VERSION_NUMBER..."
fi

# Construct the download URL
GO_URL="https://go.dev/dl/${LATEST_VERSION}.linux-amd64.tar.gz"

echo "Downloading Go ${LATEST_VERSION} from ${GO_URL}..."
curl -LO "${GO_URL}"

echo "Removing any previous Go installation from /usr/local/go..."
sudo rm -rf /usr/local/go

echo "Extracting Go tarball to /usr/local..."
sudo tar -C /usr/local -xzf "${LATEST_VERSION}.linux-amd64.tar.gz"

echo "Cleaning up tarball..."
rm "${LATEST_VERSION}.linux-amd64.tar.gz"

echo "Setting up Go environment variables..."
if ! grep -q 'export PATH=$PATH:/usr/local/go/bin' ~/.profile; then
  echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.profile
fi

# Setting up Go environment variables for fish shell
FISH_CONFIG="$HOME/.config/fish/config.fish"
if [ -f "$FISH_CONFIG" ]; then
    if ! grep -q '/usr/local/go/bin' "$FISH_CONFIG"; then
        echo 'set -U fish_user_paths /usr/local/go/bin $fish_user_paths' >> "$FISH_CONFIG"
        echo "Go path added to $FISH_CONFIG."
    else
        echo "Go path already present in $FISH_CONFIG."
    fi
else
    mkdir -p "$(dirname "$FISH_CONFIG")"
    echo 'set -U fish_user_paths /usr/local/go/bin $fish_user_paths' >> "$FISH_CONFIG"
    echo "Created $FISH_CONFIG and added Go path."
fi

echo "Go installation complete. Please restart your terminal or run 'source ~/.profile' to update your PATH."
