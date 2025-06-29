#!/bin/bash
# Just in case

# eget (to get other binaries)
if ! type eget &> /dev/null; then
	mkdir tmp
	curl -o tmp/eget.sh https://zyedidia.github.io/eget.sh
	. tmp/eget.sh
	mkdir -p ~/bin
	mv eget ~/bin
	rm -rf tmp	
fi
# Helix
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
# px
if ! type px &> /dev/null; then
	~/bin/eget walles/px --to ~/bin
fi
# up
### TODO ###
# dust
if ! type dust &> /dev/null; then
	~/bin/eget bootandy/dust --to ~/bin
fi
# duf
if ! type duf &> /dev/null; then
	~/bin/eget muesli/duf --to ~/bin
fi
# diff-so-fancy
if ! type diff-so-fancy &> /dev/null; then
	~/bin/eget so-fancy/diff-so-fancy --to ~/bin
fi
# unar
# glow
if ! type glow &> /dev/null; then
	~/bin/eget charmbracelet/glow --to ~/bin
fi
# yank
if ! type yank-cli &> /dev/null; then
	sudo apt install yank -y
fi
# fd
if ! type fd &> /dev/null; then
	~/bin/eget sharkdp/fd --to ~/bin
fi
