# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git rails bundler history ruby)

source $HOME/.bash_profile
source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games"
eval "$(rbenv init -)"

# Golang
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
if [ "$(uname)" = 'Darwin' ]; then
    export GOROOT=/usr/local/opt/go/libexec/
#elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#    export GOROOT=/usr/lib/go
fi
export PATH=$PATH:$GOROOT/bin
export PATH="/usr/local/heroku/bin:$PATH"

# peco, ghq
alias pcd='cd $(ghq list -p | peco)'
alias u='bundle exec unicorn'
alias hu='hugo server -w'
alias pim='vim $(git ls-files | peco)'

# typo
alias sl='ls'

# Ctrl-r use peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$BUFFER" )
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

export RUBYOPT="-W0"

export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH

#export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.8"`
export JDK_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home/bin/java'
export JAVA_HOME=`/usr/libexec/java_home -v "1.8"`
PATH=${JAVA_HOME}/bin:${PATH}

export MECAB_DICDIR=/usr/local/lib/mecab/dic/mecab-ipadic-neologd

# Python
#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"
#eval "$(pyenv init -)"
export PATH="/Users/tomoyanoda/bin/Sencha/Cmd:$PATH"
export PATH="/Applications/Sencha/Test/2_2_1_83/stc:$PATH"

export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init -)"
