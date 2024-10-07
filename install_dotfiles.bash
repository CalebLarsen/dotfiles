#!/bin/bash
# bashrc
rm -f ~/.bashrc
ln -s "$(pwd)/.bashrc" ~/.bashrc
# git
rm -f ~/.gitconfig 
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
# kitty
mkdir -p ~/.config/kitty
rm -f ~/.config/kitty/kitty.conf
ln -s "$(pwd)/kitty.conf" ~/.config/kitty/kitty.conf
# helix
mkdir -p ~/.config/helix/themes
rm -f ~/.config/helix/themes/molokai.toml
ln -s "$(pwd)/molokai.toml" ~/.config/helix/themes/molokai.toml
rm -f ~/.config/helix/config.toml
ln -s "$(pwd)/config.toml" ~/.config/helix/config.toml
# tmux
rm -f ~/.tmux.conf
ln -s "$(pwd)/.tmux.conf" ~/.tmux.conf
