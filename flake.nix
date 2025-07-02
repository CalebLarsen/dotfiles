{
  description = "Dotfiles entry point";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    nur.url = "github:nix-community/NUR";
  };

  outputs = { nixpkgs, home-manager, nur, ... }:
    let
      system = "aarch64-darwin";
      pkgs = import nixpkgs { inherit system; };
    in {
      homeConfigurations.caleb = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        lib = pkgs.lib;
        modules = [
          ./home-manager/home.nix
          {
            nixpkgs.overlays = [ nur.overlays.default ];
          }
          # Extra module to create symlinks
          {
            home.file.".config/home-manager/home.nix".source = ./home-manager/home.nix;
          }
        ];
      };

      apps.aarch64-darwin.home-manager = {
        type = "app";
        program = "${home-manager.packages.aarch64-darwin.home-manager}/bin/home-manager";
      };

    };
  
}

