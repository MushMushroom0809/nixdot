{
  self,
  inputs,
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
  system.defaults.dock.autohide = true;
  system.defaults.dock.persistent-apps = [ ];
  system.defaults.dock.orientation = "right";
  system.defaults.trackpad.ActuationStrength = 0;
  system.defaults.trackpad.Clicking = true;
  system.defaults.trackpad.TrackpadRightClick = true;
  system.defaults.trackpad.TrackpadThreeFingerDrag = true;
  security.pam.services.sudo_local.touchIdAuth = true;
  nix.enable = true;
  nix.settings.auto-optimise-store = false;
  nix.settings.trusted-users = [ "${username}" ];
  nix.settings.builders-use-substitutes = true;
  nix.gc.automatic = true;
  nix.gc.options = "--delete-older-than 7d";
  programs.zsh.enable = true;
  homebrew.enable = true;
  homebrew.onActivation.autoUpdate = false;
  homebrew.onActivation.upgrade = false;
  homebrew.onActivation.cleanup = "none";
  homebrew.taps = [ ];
  homebrew.brews = [ "mas" ];
  homebrew.casks = [
    "google-chrome"
    "miniforge"
    "raycast"
    "r-app"
    "rstudio"
  ];
  homebrew.masApps = { };
  nix-homebrew.enable = true;
  nix-homebrew.enableRosetta = true;
  nix-homebrew.user = "${username}";
  nix-homebrew.taps = {
    "homebrew/homebrew-core" = inputs.homebrew-core;
    "homebrew/homebrew-cask" = inputs.homebrew-cask;
  };
  nix-homebrew.mutableTaps = false;
  nix-homebrew.autoMigrate = true;
}
