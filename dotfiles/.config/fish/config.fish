abbr -a e nvim
abbr -a o xdg-open
abbr -a cr cargo
abbr -a c clear
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
abbr -a v nvim
abbr -a vim nvim

set -U fish_user_paths /home/eduardo/.cargo/bin $fish_user_paths 

if command -v paru > /dev/null
    abbr -a i paru -S
    abbr -a r paru -R
    abbr -a k paru -Rscn
    abbr -a u paru
else 
    abbr -a i sudo pacman -S
    abbr -a r sudo pacman -R
    abbr -a k sudo pacman -Rscn
    abbr -a u sudo pacman -Syu
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

