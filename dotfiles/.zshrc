# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"
export PATH=$PATH:~/.cargo/bin/
export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# 
# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

# System Management
alias i='paru -S'
alias r='paru -Rscn'
alias u='paru'
alias c='clear'
alias cl='cl() { cd "$1" && ls}; cl'
alias sys='sudo sh $HOME/Developer/edfloreshz/archconfig/maintenance.sh'
alias cat='bat'
alias ls='exa -l'

# Configurations
alias vimm='cat $HOME/Developer/edfloreshz/vimconfig/shortcuts.txt'
alias zcfg='vim $HOME/.zshrc'
alias vcfg='vim $HOME/.vimrc'

# Git Commands
alias gcl='function clonegit() { git clone https://github.com/$(basename $(dirname $1))/$(basename $1) ~/Developer/$(basename $(dirname $1))/$(basename $1); find ~/Developer -maxdepth 2 -mindepth 2 -type d -print > ~/.devpaths; };clonegit'
alias gp='git push'
alias gpl='git pull'
alias gplr='git pull upstream'
alias gc='git commit -am'
alias gs='git status'
alias gsw='git switch'
alias gl='git log --oneline'
alias gr='git rebase'
alias gri='git rebase -i'
alias grc='git rebase --continue'

# File Manipulation
alias dev='function goproj() { cd $HOME/Developer/$1/$2;};goproj'
alias up='find ~/Developer -maxdepth 2 -mindepth 2 -type d -print > ~/.devpaths'
alias edit='function open() { cd $(grep "$1" ~/.devpaths) && vim };open'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
