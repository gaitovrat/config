alias ll="ls -lh"
alias load-config="source $HOME/.zshrc"

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

source $HOME/.cargo/env

export HOMEBREW_BUNDLE_FILE="$HOME/.Brewfile"
eval "$(starship init zsh)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
