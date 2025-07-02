{ config, pkgs, lib, ... }:

{
  home.username = "caleb";
  home.homeDirectory = "/Users/caleb";
  home.stateVersion = "24.05";

  programs.home-manager.enable = true;

  home.sessionPath = [
  	"/nix/var/nix/profiles/default/bin"
    "/run/current-system/sw/bin"
    # Optional if you're still using legacy user profiles:
    "${config.home.homeDirectory}/.nix-profile/bin"

    "/usr/local/bin"
    "/usr/bin"
    "${config.home.homeDirectory}/.local/bin"
    "${config.home.homeDirectory}/bin"
    "${config.home.homeDirectory}/roms"
    "${config.home.homeDirectory}/.cargo/bin"
    "/usr/local/go/bin"
    "${config.home.homeDirectory}/.cabal/bin"
    "${config.home.homeDirectory}/.ghcup/bin"
    "/opt/homebrew/bin"
    "${config.home.homeDirectory}/.elan/bin"
  ];

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
    mergiraf # AST-aware git-merge driver
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
    ./florumbra-colors.nix
    ./bat.nix
    ./eza.nix
    ./fish.nix
    ./kitty.nix
    ./git.nix
    ./helix.nix
    ./starship.nix
    ./librewolf.nix
    ./librewolf-wrapper.nix
  ];

}
