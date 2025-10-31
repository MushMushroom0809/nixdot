{
  description = "A configuration for both macOS and NixOS";
  nixConfig.experimental-features = [
    "nix-command"
    "flakes"
  ];
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nix-darwin.url = "github:nix-darwin/nix-darwin/master";
  inputs.nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
  inputs.nix-homebrew.url = "github:zhaofengli/nix-homebrew";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.home-manager.inputs.nixpkgs.follows = "nixpkgs";
  outputs =
    inputs@{
      self,
      nixpkgs,
      nix-darwin,
      nix-homebrew,
      home-manager,
      ...
    }:
    let
      darwinHost = "darwin";
      username = "cya";
      specialArgs = { inherit self inputs username; };
    in
    {
      darwinConfigurations."${darwinHost}" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = specialArgs;
        modules = [ ./darwin/default.nix ];
      };
      homeConfigurations."${username}@${darwinHost}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.aarch64-darwin;
        extraSpecialArgs = specialArgs;
        modules = [ ./home-manager/home.nix ];
      };
      devShells.aarch64-darwin = {
        python = import ./shell/python.nix { pkgs = nixpkgs.legacyPackages.aarch64-darwin; };
        r = import ./shell/r.nix { pkgs = nixpkgs.legacyPackages.aarch64-darwin; };
      };
    };
}
