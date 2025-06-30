{ config, pkgs, lib, ... }:

let
  fishPath = "${pkgs.fish}/bin/fish";
  renderedKittyConf = pkgs.writeText "kitty.conf" (builtins.replaceStrings
    [ "\${fish_path}" ]
    [ fishPath ]
    (builtins.readFile ./kitty.conf.template));
in {
  home.file.".config/kitty/kitty.conf".source = renderedKittyConf;
}
