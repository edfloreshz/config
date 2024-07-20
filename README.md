<p align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Tux-simple.svg/154px-Tux-simple.svg.png" height="100px">
</p>

# Configuration Repository

Configuration repositories for Arch Linux, KDE Plasma, Oh My Zsh, Vim, Tmux and Alacritty.

# Commands
Install Iosevka Term:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/edfloreshz/config/main/linux/iosevka.sh | bash
```

Place dotfiles:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/place.sh | bash
```

Install Rust:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash
```

GPG:
1. [Generate GPG Keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)

```
// Remove existing signing key
git config --unset user.signingkey

// Find long signing key
gpg --list-secret-keys --keyid-format=long

// Add new signing key
git config user.signingkey SECRETKEYLONGID

// Tell git to automatically sign every commit
git config commit.gpgsign true
```
