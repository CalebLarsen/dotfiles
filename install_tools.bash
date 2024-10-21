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
	sudo add-apt-repository ppa:maveonair/helix-editor
	sudo apt update
	sudo apt install helix -y
	# # Install queries so that highlighting actually works. Doesn't work out of the box, closed issue apparently (https://github.com/helix-editor/helix/discussions/11379)
	# mkdir -p ~/.config/helix/runtime/queries
	# RUNTIME=~/.config/helix/runtime
	# GRAMMARS=$(find ~/.config/helix/runtime/grammars/sources -maxdepth 1)
	# for GRAMMAR_FULL in $GRAMMARS; do
	# 	GRAMMAR=$(basename $GRAMMAR_FULL)
	# 	if [ -d "$RUNTIME/grammars/sources/$GRAMMAR/queries" ]; then
	# 		mkdir -p "$RUNTIME/queries/$GRAMMAR"
	# 		QUERIES=$(find "$RUNTIME/grammars/sources/$GRAMMAR/queries/" -name "*.scm")
	# 		cp $QUERIES "$RUNTIME/queries/$GRAMMAR/"
	# 	fi
	# done
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
if ! type unar &> /dev/null; then
	sudo apt install unar -y
fi
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
# npm (dependency for other things)
if ! type node &> /dev/null; then
	sudo apt install nodejs -y
fi
