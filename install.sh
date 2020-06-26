#!/bin/sh

# Assumptions: You use ubuntu/arch and you have 64 bit architecture

UBUNTU="ubuntu"
ARCH="arch"

# Install dependencies

# Check OS
OS=$(cat /etc/*-release | awk '/^ID=/{p=index($1,"=");print substr($1,p+1)}')
# Install on Ubuntu
if [ "$OS" = "$UBUNTU" ]; then
    # command -v foo >/dev/null 2>&1 || { ELSE }
    # Checks if command exists. If not, execute ELSE body

    # fzf
    command -v fzf >/dev/null 2>&1 || ( git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install )
    # ripgrep
    command -v rg >/dev/null 2>&1 || ( curl -o ripgrep.deb -L https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb && sudo dpkg -i ripgrep.deb && rm ripgrep.deb )
    # vivid
    command -v vivid >/dev/null 2>&1 || ( wget -O vivid.deb "https://github.com/sharkdp/vivid/releases/download/v0.5.0/vivid_0.5.0_amd64.deb" && sudo dpkg -i vivid.deb && rm vivid.deb)
    # exa
    command -v exa >/dev/null 2>&1 || (curl -o exa.zip -L https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip && unzip exa.zip && sudo mv exa-linux-x86_64 /usr/bin/exa && rm exa.zip)
    # zinit
    ZINIT=$HOME/.zinit/bin/zinit.zsh
    if [ ! -f "$ZINIT" ]; then
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zinit/master/doc/install.sh)"
    fi
    # firacode
    FIRA_EXISTS=$(fc-list | grep "firacode" | wc | awk '{print $1}')
    if [ "$FIRA_EXISTS" -eq 0 ]; then
        sudo add-apt-repository universe
        sudo apt update
        sudo apt install fonts-firacode
    fi
    # z
    Z_DIR=$HOME/z
    if [ ! -d "$Z_DIR" ]; then
        mkdir ~/z
        git clone https://github.com/rupa/z.git ~/z 
    fi
    # vim plugged
    PLUGGED_DIR=$HOME/.vim/plugged
    if [ ! -d "$PLUGGED_DIR" ]; then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi
    # kitty
    command -v kitty >/dev/null 2>&1 || ( curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin && ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/ && cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications && sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop )

fi
# TODO Install on Arch
# fzf
# ripgrep
# vivid
# exa
# zinit
# p10k
# firacode
# vim plugged
# kitty

# Move dotfiles to appropriate locations
cp .vimrc ~/.vimrc
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf
mkdir -p ~/.config/kitty && cp kitty.conf ~/.config/kitty/kitty.conf
