#!/bin/bash

# もしLinuxでなければ終了
if [ "$(uname)" != 'Linux' ]; then
    echo "This script is for Linux"
    exit 1
fi

# apt update
sudo apt update

# zshがインストールされていなければインストール
if ! type zsh > /dev/null 2>&1; then
    echo "zsh is not installed"
    echo "installing zsh..."
    sudo apt install -y zsh
fi

# zshをデフォルトシェルに設定
if [ "$(echo $SHELL)" != '/usr/bin/zsh' ]; then
    echo "zsh is not default shell"
    echo "setting zsh to default shell..."
    chsh -s /usr/bin/zsh
fi