{
  description = "A configuration for both macOS and NixOS";
  nixConfig = {
    experimental-features = [
      "nix-command"
      "flakes"
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
      devShells = {
        aarch64-darwin.c_cpp = import ./shell/c_cpp.nix {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        };
        aarch64-darwin.py312 = import ./shell/py312.nix {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        };
        aarch64-darwin.node24 = import ./shell/node24.nix {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        };
      };
    };
}
