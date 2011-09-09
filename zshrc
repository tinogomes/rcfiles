# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tinogomes"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want disable red dots displayed while waiting for completion
# DISABLE_COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew bundler cap gem git github mercurial osx rails3 ruby rvm)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=./bin:~/bin:$PATH
export CDPATH=.:~:~/Projects:~/Projects/d2b:~/Projects/github
export EDITOR='mate -w'

alias mt="mate ."

alias localserver="python -m SimpleHTTPServer"

alias fp="cd ~/Projects/concrete/fazpagar-portal/src/fazpagar"
alias deploy="git push; cap deploy"

alias bundles='cd ~/Library/Application\ Support/TextMate/Bundles'
