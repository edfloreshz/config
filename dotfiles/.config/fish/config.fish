set -U fish_user_paths $HOME/.cargo/bin $fish_user_paths
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

if command -v apt > /dev/null
    abbr -a i sudo apt install
    abbr -a r sudo apt remove
    abbr -a k sudo apt remove --purge
    abbr -a f sudo apt update
    abbr -a u sudo apt upgrade
else if command -v dnf > /dev/null
    abbr -a i sudo dnf install
    abbr -a r sudo dnf remove
    abbr -a f sudo dnf update
    abbr -a u sudo dnf upgrade
else if command -v brew > /dev/null
    abbr -a i brew install
    abbr -a r brew uninstall
    abbr -a k brew uninstall --force
    abbr -a f brew update
    abbr -a u brew upgrade
else if command -v port > /dev/null
    abbr -a i sudo port install
    abbr -a r sudo port uninstall
    abbr -a f sudo port outdated
    abbr -a u sudo port upgrade outdated
    abbr -a up sudo port selfupdate
end

if command -v exa > /dev/null
    abbr -a l 'exa --git'
    abbr -a ls 'exa --git'
    abbr -a ll 'exa -l --git'
    abbr -a lll 'exa -la --git'
else
    abbr -a l 'ls'
    abbr -a ll 'ls -l'
    abbr -a lll 'ls -la'
end

if command -v bat > /dev/null
    abbr -a cat bat
else
    abbr -a cat cat
end

abbr -a o xdg-open
abbr -a c clear
abbr -a cg cargo
abbr -a cr cargo run
abbr -a cb cargo build
abbr -a ct cargo test
abbr -a cl clear
abbr -a ff freshfetch
abbr -a g git
abbr -a gs git status
abbr -a gc git commit
abbr -a gf git fetch
abbr -a gp git push
abbr -a gpl git pull
abbr -a ga git add
abbr -a gsw git switch
abbr -a gck git checkout
abbr -a gl git log --oneline
abbr -a gr git rebase
abbr -a gri git rebase -i
abbr -a grc git rebase --continue
