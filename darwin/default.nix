{
  self,
  inputs,
  config,
  username,
  ...
}:
{
  imports = [ inputs.nix-homebrew.darwinModules.nix-homebrew ];
  nixpkgs.hostPlatform = "aarch64-darwin";
  nixpkgs.config.allowUnfree = true;
  users.users."${username}".home = "/Users/${username}";
  system.primaryUser = "${username}";
  system.stateVersion = 6;
  system.configurationRevision = self.rev or self.dirtyRev or null;
  system.activationScripts.extraActivation.text = ''
    softwareupdate --install-rosetta --agree-to-license
  '';
  security.pam.services.sudo_local.touchIdAuth = true;
  nix.enable = true;
  nix.settings.auto-optimise-store = false;
  nix.settings.trusted-users = [ "${username}" ];
  nix.settings.builders-use-substitutes = true;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = false;
  homebrew.onActivation.upgrade = false;
  homebrew.onActivation.cleanup = "none";
  homebrew.taps = builtins.attrNames config.nix-homebrew.taps;
  homebrew.brews = [ "mas" ];
  homebrew.casks = [
    "google-chrome"
    "miniforge"
    "raycast"
  ];
  homebrew.masApps = { };
  nix-homebrew.enable = true;
  nix-homebrew.enableRosetta = true;
  nix-homebrew.user = "${username}";
  nix-homebrew.taps = { };
  nix-homebrew.mutableTaps = true;
  nix-homebrew.autoMigrate = false;
}
