{ config, pkgs, ... }:

let
  librewolfApp = pkgs.librewolf;
  wrapper = pkgs.writeShellScriptBin "librewolf" ''
    exec "${librewolfApp}/Applications/LibreWolf.app/Contents/MacOS/librewolf" "$@"
  '';
in {
  home.packages = [ wrapper ];
}

