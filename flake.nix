{
  description = "A configuration for both macOS and NixOS";
  nixConfig = {
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    trusted-substituters = [
      "https://cache.nixos.org/"
      "https://nix-community.cachix.org"
      "https://devenv.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw="
    ];
  };
  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs = {
        nixpkgs = {
          follows = "nixpkgs";
        };
      };
    };
  };
  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      homebrew-core,
      homebrew-cask,
      home-manager,
      ...
    }:
    let
      darwinHost = "m4pro";
      nixosHost = "nixos-vm";
      username = "cya";
      specialArgs = { inherit self inputs username; };
    in
    {
      darwinConfigurations = {
        "${darwinHost}" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          specialArgs = specialArgs;
          modules = [ ./hosts/m4pro/default.nix ];
        };
      };
      nixosConfigurations = {
        "${nixosHost}" = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = specialArgs;
          modules = [ ./hosts/nixos-vm/default.nix ];
        };
      };
      homeConfigurations = {
        "${username}@${darwinHost}" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          extraSpecialArgs = specialArgs;
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
