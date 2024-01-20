export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ll="ls -lh"
alias load-config="source $HOME/.zshrc"

brew-remove() {
    brew uninstall $1
    brew autoremove
    brew cleanup -s
}

source $HOME/.cargo/env

export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
