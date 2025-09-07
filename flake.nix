# > sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install)
# > sudo nix run nix-darwin --extra-experimental-features "nix-command flakes"  -- switch --flake ~/nixdot#cya
# > sudo darwin-rebuild --flake ~/nixdot#cya switch
{
  description = "A configuration for both macOS and NixOS";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
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
      inputs.nixpkgs.follows = "nixpkgs";
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
      darwin_config =
        { pkgs, ... }:
        {

          nixpkgs = {
            hostPlatform = "aarch64-darwin";
            config = {
              allowUnfree = true;
            };
          };

          users.users.cya = {
            home = "/Users/cya";
            description = "cya";
          };

          system = {
            primaryUser = "cya";
            stateVersion = 6;
            configurationRevision = self.rev or self.dirtyRev or null;
            defaults = {
              dock = {
                autohide = true;
                autohide-delay = 0.3;
                persistent-apps = [ ];
                orientation = "right";
                wvous-tl-corner = 1;
                wvous-tr-corner = 1;
                wvous-bl-corner = 1;
                wvous-br-corner = 1;
              };
              finder = {
                AppleShowAllExtensions = true;
                AppleShowAllFiles = true;
                ShowPathbar = true;
                ShowStatusBar = true;
                _FXShowPosixPathInTitle = true;
              };
              trackpad = {
                ActuationStrength = 0;
                Clicking = true;
                TrackpadRightClick = true;
                TrackpadThreeFingerDrag = true;
              };
            };
          };

          security.pam.services.sudo_local.touchIdAuth = true;

          environment = {
            systemPackages = with pkgs; [
              git
              just
              mkalias
            ];
            shells = with pkgs; [
              zsh
            ];
            variables = {
              EDITOR = "nvim";
            };
          };

          fonts = {
            packages = with pkgs; [
              nerd-fonts.hack
              nerd-fonts.fira-code
              nerd-fonts.jetbrains-mono
              nerd-fonts.symbols-only
            ];
          };

          nix = {
            enable = true;
            settings = {
              experimental-features = [
                "nix-command"
                "flakes"
              ];
              auto-optimise-store = false;
              trusted-users = [ "cya" ];
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
            brews = [
              "mas"
            ];
            casks = [
              "discord"
              "firefox"
              "google-chrome"
              "hiddenbar"
              "keka"
              "microsoft-edge"
              "microsoft-word"
              "microsoft-excel"
              "microsoft-powerpoint"
              "raycast"
              "stats"
              "visual-studio-code"
            ];
            masApps = {
              "LINE" = 539883307;
              "adguard-for-safari" = 1440147259;
            };
          };

        };
      nix_homebrew_config = {
        nix-homebrew = {
          enable = true;
          enableRosetta = true;
          user = "cya";
          taps = {
            "homebrew/homebrew-core" = homebrew-core;
            "homebrew/homebrew-cask" = homebrew-cask;
          };
          mutableTaps = false;
          autoMigrate = true;
        };
      };
      home_manager_config =
        { pkgs, ... }:
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.cya = {
            home = {
              username = "cya";
              homeDirectory = "/Users/cya";
              stateVersion = "25.05";
              packages = with pkgs; [
                btop
                cargo
                direnv
                emacs
                fastfetch
                fzf
                go
                lsd
                nixfmt-rfc-style
                neovim
                nodejs_24
                p7zip
                ripgrep
                vim
                starship
                unzip
                uv
                xz
                wezterm
                zip
              ];
              file = {
                ".config/nvim/init.lua".source = ./home/nvim/init.lua;
                ".config/wezterm/wezterm.lua".source = ./home/wezterm/wezterm.lua;
                ".emacs.d/init.el".source = ./home/emacs/init.el;
                ".vim/vimrc".source = ./home/vim/vimrc;
                "Library/Application Support/Code/User/settings.json".source = ./home/vscode/settings.json;
                "Library/Application Support/Code/User/keybindings.json".source = ./home/vscode/keybindings.json;
              };
            };
            programs = {
              home-manager = {
                enable = true;
              };
              zsh = {
                enable = true;
                enableCompletion = true;
                shellAliases = {
                  ls = "lsd";
                  ff = "fastfetch";
                  nv = "nvim";
                  vim = "nvim";
                  em = "emacs -nw";
                  tree = "lsd -al --tree";
                };
              };
              starship = {
                enable = true;
                enableBashIntegration = true;
                enableZshIntegration = true;
              };
            };
          };
        };
    in
    {
      darwinConfigurations = {
        "cya" = nix-darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            darwin_config
            nix-homebrew.darwinModules.nix-homebrew
            nix_homebrew_config
            home-manager.darwinModules.home-manager
            home_manager_config
          ];
        };
      };
    };
}
