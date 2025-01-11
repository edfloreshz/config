<p align="center">
    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/2b/Tux-simple.svg/154px-Tux-simple.svg.png" height="100px">
</p>

# Configuration Repository

Configuration steps for my system.

# Commands
Dependencies:
```bash
sudo apt install fish dialog libssl-dev just libxkbcommon-dev
chsh -s /usr/bin/fish
```

Install Rust:
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash
cargo install devmode
```

Install Iosevka Term:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/edfloreshz/config/main/linux/iosevka.sh | bash
```

Place dotfiles:
```bash
curl --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/edfloreshz/config/main/dotfiles/place.sh | bash
```

GPG:
1. [Generate GPG Keys](https://docs.github.com/en/authentication/managing-commit-signature-verification/about-commit-signature-verification)
