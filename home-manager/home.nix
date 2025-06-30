{ config, pkgs, ... }:

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
  ];

  imports = [
    ./fish.nix
  ];
}
