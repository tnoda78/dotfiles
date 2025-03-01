### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit snippet PZT::modules/helper/init.zsh

zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::mercurial
zinit snippet OMZP::history
zinit cdclear -q

zinit snippet OMZT::gentoo

# Golang
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin
if [ "$(uname)" = 'Darwin' ]; then
    export GOROOT=/usr/local/opt/go/libexec/
#elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
#    export GOROOT=/usr/lib/go
fi
export PATH=$PATH:$GOROOT/bin

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

