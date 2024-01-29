#! /bin/bash

TARGET_DIR=$HOME
SCRIPT_PATH=$(readlink -f $0)
SOURCE_DIR=$(dirname $SCRIPT_PATH)

check() {
    read -p "Do you want to install $1? (y/n) " on
    [ $on == "y" ]
}

if check brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

ln -sv $SOURCE_DIR/zshrc $HOME/.zshrc
ln -sv $SOURCE_DIR/Brewfile $HOME/.Brewfile
ln -sv $SOURCE_DIR/vimrc $HOME/.vimrc
mkdir -pv $HOME/.config/mpv && \
    ln -sv $SOURCE_DIR/mpv/input.conf $HOME/.config/mpv/input.conf

brew bundle install --file=$SOURCE_DIR/Brewfile

