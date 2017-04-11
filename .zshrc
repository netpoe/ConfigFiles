# Path to mongodb bin & custom commands
export PATH="/Users/GustavoIbarra/mongodb/bin:/Users/GustavoIbarra/.composer/vendor/bin:/Users/GustavoIbarra/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php54)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php55)/bin:$PATH"
# export PATH="$(brew --prefix homebrew/php/php56)/bin:$PATH"
export PATH="$(brew --prefix homebrew/php/php70)/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bira"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Sass Script
# alias sw="sass --watch"
# alias swm="sass --watch main.scss:main.css"
# alias sws="sass --watch style.scss:style.css"
# alias swebm="sass --watch ebm.scss:ebm.css"
# CoffeeScript
# alias coffeew="coffee --watch --compile --output lib/ src/"
# GIT Clone EBM Boileplate
alias gitc="git checkout"
alias gitcam="git commit --amend -a --no-edit"
alias gitcb="git checkout -b"
alias gitbd="git branch -D"
alias gitpo="git pull origin"
alias gitpu="git pull upstream"
alias gitb="git for-each-ref --sort='-authordate:iso8601' --format=' %(authordate:relative)%09%(refname:short)' refs/heads"
alias gitrb="git ls-remote --heads origin"
alias gitlog="git log --name-status"
alias gits="git status"
# SSH
alias sshroot="ssh -o ServerAliveInterval=100"
# Custom commands
# alias meteor-directories="~/bin/meteor-directories"
alias wp-install="~/bin/wp-install"
alias wp-build="~/bin/wp-build"
alias meteor-install="~/bin/meteor-install"
alias laravel-install="~/bin/laravel-install"
# Pretty JSON
alias json="python -mjson.tool"
# Sublime text
alias stt="stt"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git sublime web-search)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH="/bin:/Users/GustavoIbarra/.rvm/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/heroku/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# RUBY GEMS
# export PATH=$(brew --prefix ruby)/bin:$PATH
# export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

export p="/Users/GustavoIbarra/Projects/"
export HDrive=/Volumes/Seagate\ Backup\ Plus\ Drive
export HTD="${HDrive}/htdocs"
export EBM="${p}/EBM"
export HTML5="${HTD}/HTML5"
export JS="${HTD}/JS"
export Meteor="${HTD}/Meteor"
export BASHDIR="${HTD}/Codio/Bash"
export WP="${p}/Wordpress"
export SQL="${HTD}/Codio/MySQL"
export TEMP="${p}/temp_assets"
export kf="${p}/kf"

export LOCAL_IP=$(ipconfig getifaddr en0)