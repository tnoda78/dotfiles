# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git rails tmux bundler history ruby)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="/home/tnoda/.rbenv/shims:/home/tnoda/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
eval "$(rbenv init -)"

# Golang
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

