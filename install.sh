#!/bin/sh

# Move dotfiles to appropriate locations
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
mkdir -p ~/.config/kitty && cp kitty.conf ~/.config/kitty/kitty.conf
