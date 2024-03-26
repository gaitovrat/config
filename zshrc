export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
plugins=(git)

source $ZSH/oh-my-zsh.sh

alias ll="ls -lh"
alias load-config="source $HOME/.zshrc"
alias cmake-docs="open /opt/homebrew/share/doc/cmake/html/index.html"

gping() {
    if [ $# -lt 1 ]
    then
        count=3
    else
        count=$1
    fi

    ping -c $count google.com
}

brew-remove() {
    brew uninstall $1
    brew autoremove
    brew cleanup -s
}

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="lambda"
plugins=(git)

source $ZSH/oh-my-zsh.sh

source $HOME/.cargo/env

export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

