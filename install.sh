#! /bin/bash

TARGET_DIR=$HOME
SCRIPT_PATH=$(readlink -f $0)
SOURCE_DIR=$(dirname $SCRIPT_PATH)

GIT_NAME="Ratmir Gaitov"
GIT_EMAIL="gaitovrat@gmail.com"
PULL_REBASE="true"
PUSH_AUTO_SETUP_REMOTE="true"
INIT_DEFAULT_BRANCH="main"

if [ ! $(which cargo) ]; then
    echo Installing rust...
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh \
        -s -- -y
fi

if [ ! $(which brew) ]; then
    echo Installing brew...
    /bin/bash -c \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if [ ! -e "$HOME/.sdkman" ]; then
    echo Installing SDKMan...
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if [ ! -e "$HOME/.oh-my-zsh" ]; then
    echo Installing oh-my-zsh...
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    rm -v $HOME/.zshrc
fi

echo Updating git config...
git config --global user.name "$GIT_NAME"
git config --global user.email "$GIT_EMAIL"
git config --global pull.rebase "$PULL_REBASE"
git config --global init.defaultBranch "$INIT_DEFAULT_BRANCH"
git config --global push.autoSetupRemote "$PUSH_AUTO_SETUP_REMOTE"

ln -sv $SOURCE_DIR/zshrc $HOME/.zshrc
ln -sv $SOURCE_DIR/Brewfile $HOME/.Brewfile
ln -sv $SOURCE_DIR/vimrc $HOME/.vimrc
mkdir -pv $HOME/.config/mpv && \
    ln -sv $SOURCE_DIR/mpv/input.conf $HOME/.config/mpv/input.conf

brew bundle install --file=$SOURCE_DIR/Brewfile

echo Installing Java...
sdk i java
echo Installing Maven...
sdk i maven

