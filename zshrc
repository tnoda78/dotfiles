# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="afowler"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git bundler history ruby)

source $ZSH/oh-my-zsh.sh

# User configuration
export PATH="$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games":$PATH
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
alias gbrda='git branch | xargs git branch -d'

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

export JAVA_HOME=$HOME/.sdkman/candidates/java/current
export PATH=$JAVA_HOME/bin:$PATH

export SBT_OPTS='-Xmx2G -Xss4M'
export PATH="/Applications/Sencha/Test/2_3_0_328/stc:$PATH"

eval "$(jump shell)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export PATH="/Users/tomoyanoda/bin/Sencha/Cmd:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
