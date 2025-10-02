{
  self,
  inputs,
  username,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];
  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config = {
      allowUnfree = true;
    };
  };
  users.users."${username}" = {
    home = "/Users/${username}";
    description = "${username}";
  };
  system = {
    primaryUser = "${username}";
    stateVersion = 6;
    configurationRevision = self.rev or self.dirtyRev or null;
    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.3;
        persistent-apps = [ ];
        orientation = "right";
      };
      trackpad = {
        ActuationStrength = 0;
        Clicking = true;
        TrackpadRightClick = true;
        TrackpadThreeFingerDrag = true;
      };
    };
  };
  security = {
    pam = {
      services = {
        sudo_local = {
          touchIdAuth = true;
        };
      };
    };
  };
  nix = {
    enable = true;
    settings = {
      auto-optimise-store = false;
      trusted-users = [ "${username}" ];
      builders-use-substitutes = true;
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 7d";
    };
  };
  programs = {
    zsh = {
      enable = true;
    };
  };
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "none";
    };
    taps = [ ];
    brews = [ "mas" ];
    casks = [
      "google-chrome"
      "keka"
      "raycast"
    ];
    masApps = {
      "LINE" = 539883307;
      "adguard-for-safari" = 1440147259;
      "keynote" = 409183694;
      "pages" = 409201541;
      "numbers" = 409203825;
    };
  };
  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = "${username}";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
    autoMigrate = true;
  };
}
