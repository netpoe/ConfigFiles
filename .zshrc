# Path to mongodb bin
export PATH=$PATH:"/Users/gandresibarra/mongodb/bin"

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
alias sw="sass --watch"
alias swm="sass --watch main.scss:main.css"
alias sws="sass --watch style.scss:style.css"
alias swebm="sass --watch ebm.scss:ebm.css"
# CoffeeScript
alias coffeew="coffee --watch --compile --output lib/ src/"
# GIT Clone EBM Boileplate
alias gcbp="git clone https://github.com/EasyBoxModel/EBM.git"
alias gitc="git checkout"
alias gitpo="git pull origin"
# SSH
alias sshroot="ssh -o ServerAliveInterval=100"


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

# export PATH="/bin:/Users/gandresibarra/.rvm/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/heroku/bin"
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

# ENV VARIABLES
# export PATH=/bin:/Users/gandresibarra/.rvm/bin:/usr/local/git/bin:/usr/local/bin:/usr/bin:/usr/sbin:/sbin:/usr/local/heroku/bin

export HTD=/Volumes/Seagate\ Backup\ Plus\ Drive/htdocs/
export EBM="${HTD}EBM"
export HTML5="${HTD}HTML5"
export JS="${HTD}JS"
export Meteor="${HTD}Meteor"
export BASHDIR="${HTD}/Codio/Bash"
export WP="${HTD}WP"
export SQL="${HTD}/Codio/MySQL"

###

# HGServer pwd
# export HGPWD=~/.hg-server-pwd.txt
export HGPWD=Ko0ddeIopBNS

# Open new tab in iTerm
N()
{
	local cmd=$1
	osascript -e 'tell application "iTerm" to activate' \
	-e 'tell application "System Events" to tell process "iTerm" to keystroke "t" using command down' \
	-e 'tell application "System Events" to tell process "iTerm" to keystroke "clear"' \
	-e 'tell application "System Events" to tell process "iTerm" to key code 52'
}

# Get latest wordpress install and EBM it
wp-install()
{
	local directory_name=$1
	local db_name=$2
	cd $WP
	mkdir $directory_name
	cd $directory_name
	curl -O https://wordpress.org/latest.tar.gz
	tar -xvf latest.tar.gz
	cp -R wordpress/. .
	rm -r wordpress/
	mv wp-config-sample.php wp-config.php
	echo -e "?>" >> wp-config.php
	sed -i '' "s/database_name_here/$db_name/g" wp-config.php
	sed -i '' "s/username_here/root/g" wp-config.php
	sed -i '' "s/password_here/N3tp0ePl\@n/g" wp-config.php
	cd wp-content/themes
	gcbp
	cd EBM
	git checkout wordpress-boilerplate
	cd ..
	mv EBM $directory_name
	rm -rf $directory_name/.git
	mv $directory_name/.gitignore ../..
	mv $directory_name/README.md ../..
	rm -rf twentyfourteen twentythirteen
	cd ../..
	git init
	stt
}

meteor-install()
{
	local project_name=$1
	local -a view_names
	view_names=('index' 'show' 'new' 'edit')
	cd $Meteor
	meteor create $project_name
	cd $project_name
	find . -maxdepth 1 -not -name ".meteor" -delete
	cp -R "$Meteor/meteor_BP/." "$Meteor/$project_name/"
	rm -rf ".git"
	cp -R "$EBM/src/scss/." "$Meteor/$project_name/client/stylesheets/"
	git init
	meteor remove insecure autopublish
	meteor add iron:router underscore jquery check reactive-var tracker random accounts-base accounts-password accounts-ui aldeed:collection2 aldeed:simple-schema ecmascript session service-configuration
	cd ".grunt" 
	npm install
	N
	cd ..
	for view in ${@:2}
	do
		mkdir "client/views/$view"
		touch	"lib/router/controller-$view.js" \
					"lib/collections/collection-$view.js" \
					"server/methods/methods-$view.js" \
					"server/publications/publications-$view.js"
		for i in ${view_names[@]}; do
			touch "client/views/$view/$view-$i.html" \
						"client/views/$view/$view-$i.js"
		done
	done
	meteor update 
	stt
	meteor
}

export -f wp-install
export -f meteor-install
export -f N
export NVM_DIR="/Users/gandresibarra/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
