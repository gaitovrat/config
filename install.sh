#! /bin/bash

TARGET_DIR=$HOME
SOURCE_DIR=$(dirname $0)

if [ $SOURCE_DIR == "." ]; then
    SOURCE_DIR=$PWD
else
    SOURCE_DIR=$PWD/$SOURCE_DIR
fi

read -p "Do you want to install oh-my-zsh? (y/n) " oh_my_zsh_on

if [ $oh_my_zsh_on == "y" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ln -sv $SOURCE_DIR/zshrc $HOME/.zshrc
