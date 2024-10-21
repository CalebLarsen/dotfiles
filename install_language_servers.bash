#!/bin/bash
# Bash
if ! type shellcheck &> /dev/null; then
  sudo apt install shellcheck -y
fi
if ! type shfmt &> /dev/null; then
  go install mvdan.cc/sh/v3/cmd/shfmt@latest
fi
if ! type bash-language-server &> /dev/null; then
  ~/bin/npm i -g bash-language-server
fi
# C/C++
if ! type clang &> /dev/null; then
  sudo apt install clang -y
fi
if ! type clangd &> /dev/null; then
  sudo apt install clangd-18 -y
  sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-18 100
fi
