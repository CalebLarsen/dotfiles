#!/bin/bash
rm -f ~/.bashrc
ln -s "$(pwd)/.bashrc" ~/.bashrc
rm -f ~/.gitconfig 
ln -s "$(pwd)/.gitconfig" ~/.gitconfig
if pidof X; then
	mkdir -p ~/.config/kitty
	ln -s kitty.conf ~/.config/kitty/kitty.conf
fi
