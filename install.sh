#! /bin/bash

TARGET_DIR=$HOME
SOURCE_DIR=$(dirname $0)

if [ $SOURCE_DIR == "." ]; then
    SOURCE_DIR=$PWD
else
    SOURCE_DIR=$PWD/$SOURCE_DIR
fi

check() {
    read -p "Do you want to install $1? (y/n) " on
    [ $on == "y" ]
}

if check oh-my-zsh; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if check brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

ln -sv $SOURCE_DIR/zshrc $HOME/.zshrc
ln -sv $SOURCE_DIR/Brewfile $HOME/.Brewfile
ln -sv $SOURCE_DIR/vimrc $HOME/.vimrc
mkdir -pv $HOME/.config/mpv && \
    ln -sv $SOURCE_DIR/mpv/input.conf $HOME/.config/mpv/input.conf

brew bundle install --file=$SOURCE_DIR/Brewfile

