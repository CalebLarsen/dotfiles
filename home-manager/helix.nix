{ config, lib, pkgs, ...}:

{
  home.file = {
    ".config/helix/config.toml".source = ../helix/config.toml;
    ".config/helix/themes/florumbra.toml".source = ../helix/florumbra.toml;
  };
}
