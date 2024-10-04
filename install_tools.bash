#!/bin/bash
# Just in case
if ! type gcc &> /dev/null; then
	sudo apt install gcc -y
fi
if ! type g++ &> /dev/null; then
	sudo apt install g++ -y
fi

# eget (to get other binaries)
if ! type eget &> /dev/null; then
	mkdir tmp
	curl -o tmp/eget.sh https://zyedidia.github.io/eget.sh
	. tmp/eget.sh
	mkdir -p ~/bin
	mv eget ~/bin
	rm -rf tmp	
fi
# setxkbmap (for caps escape)
if ! type setxkbmap &> /dev/null; then
	sudo apt install x11-xkb-utils -y
fi
# Helix
if ! type hx &> /dev/null; then 
	~/bin/eget helix-editor/helix --to ~/bin
	~/bin/hx --grammar fetch
	~/bin/hx --grammar build
fi
# fzf
if ! type fzf &> /dev/null; then
	~/bin/eget junegunn/fzf --to ~/bin
fi
# zoxide
if ! type zoxide &> /dev/null; then
	~/bin/eget ajeetdsouza/zoxide --to ~/bin
fi
# ripgrep
if ! type rg &> /dev/null; then
	~/bin/eget BurntSushi/ripgrep --to ~/bin
fi
# bat
if ! type bat &> /dev/null; then
	~/bin/eget sharkdp/bat --to ~/bin
fi
# eza
if ! type eza &> /dev/null; then
	~/bin/eget eza-community/eza --to ~/bin
fi
# FiraCode
### TODO ###
