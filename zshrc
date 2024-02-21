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
QT_DIR=$HOME/lib/Qt/6.6.2/macos/lib/cmake
if [ -d $QT_DIR ]; then
    for directory in $(ls $QT_DIR); do
        export "${directory}_DIR"="$QT_DIR/$directory"
    done
fi

