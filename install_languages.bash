#!/bin/bash
NEED_UPDATE=0
# C
if ! type gcc &> /dev/null; then
  sudo apt install build-essential -y
fi
# C++
if ! type g++ &> /dev/null; then
  sudo apt install g++ -y
fi
# Go
if ! type go &> /dev/null; then
  sudo rm -rf /usr/local/go
  # 1.23
  curl -L -o go.tar.gz https://go.dev/dl/go1.23.2.linux-amd64.tar.gz
  sudo tar -C /usr/local -xzf go.tar.gz
  rm go.tar.gz
  NEED_UPDATE=1
fi
# Rust
if ! type rustc &> /dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  NEED_UPDATE=1
fi
# Zig
if ! type zig &> /dev/null; then
  # 0.13
  curl -L -o zig.tar.xz https://ziglang.org/download/0.13.0/zig-linux-x86_64-0.13.0.tar.xz
  tar -xf zig.tar.xz
  ZIGDIR=zig-linux-x86_64-0.13.0
  sudo mv $ZIGDIR/zig /usr/local/bin 
  sudo mkdir -p /usr/local/lib/zig
  sudo mv $ZIGDIR/lib /usr/local/lib/zig
  rm zig.tar.xz
  rm -rf $ZIGDIR
fi
# Haskell
if ! type ghc &> /dev/null; then
  sudo apt install build-essential curl libffi-dev libffi8 libgmp-dev libgmp10 libncurses-dev pkg-config -y
  curl --proto '=https' --tlsv1.2 -sSf https://get-ghcup.haskell.org | sh
  NEED_UPDATE=1
fi

if [ $NEED_UPDATE -eq 1 ]; then
  echo "\n\nPlease update your bash session as environment variables have changed"
fi
