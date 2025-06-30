{ config, pkgs, lib, ... }:

{
  home.username = "caleb";
  home.homeDirectory = "/Users/caleb";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    fish # shell, autocomplete
    bat # cat; man, colors and 
    fd # find, nicer defaults
    ripgrep # grep, nicer defaults
    eza # ls, prettier
    fzf # fuzzy find
    zoxide # fancy cd
    # FiraCode?
    dust # du, nicer defaults
    duf # fancy df
    delta # fancy git diff tool
    unar # unarchiving tool, it's just nice
    starship # fancy prompt, could be dropped
    kitty # terminal, I like ligatures :)
    fira-code # font with ligatures, also pretty
    tldr # quick examples of command usage
    # espanso # text-expander
    ### Languages
    rustup # Rust
    go
    lua
    python3
    zig
    ghc # Haskell
    clang # C
    ### Language Servers
    shellcheck # Shell
    shfmt # Shell
    bash-language-server # Bash
  ];

  # FiraCode Installation
  home.file."Library/Fonts/FiraCode-Regular.ttf".source
    = lib.mkIf pkgs.stdenv.isDarwin "${pkgs.fira-code}/share/fonts/truetype/FiraCode-Regular.ttf";
  home.file."Library/Fonts/FiraCode-Bold.ttf".source
    = lib.mkIf pkgs.stdenv.isDarwin "${pkgs.fira-code}/share/fonts/truetype/FiraCode-Bold.ttf";
  home.file."Library/Fonts/FiraCode-Light.ttf".source
    = lib.mkIf pkgs.stdenv.isDarwin "${pkgs.fira-code}/share/fonts/truetype/FiraCode-Light.ttf";
  
  imports = [
    ./fish.nix
    ./kitty.nix
    ./git.nix
    ./helix.nix
    ./starship.nix
  ];
}
