alias ll="ls -lh"
alias load-config="source $HOME/.zshrc"

brew-remove() {
    brew uninstall $1
    brew autoremove
    brew cleanup -s
}

source $HOME/.cargo/env

export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
