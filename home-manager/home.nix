{
  config,
  pkgs,
  username,
  ...
}:
{
  home = {
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      btop
      cargo
      direnv
      emacs
      fastfetch
      fzf
      go
      git
      lsd
      nerd-fonts.jetbrains-mono
      neofetch
      neovim
      nixfmt-rfc-style
      nodejs_24
      ripgrep
      ripgrep-all
      ruby
      starship
      uv
      wezterm
      wget
      zsh
    ];
    file = {
      ".config/nvim/init.lua".source = ./nvim/init.lua;
      ".config/wezterm/wezterm.lua".source = ./wezterm/wezterm.lua;
      ".emacs.d/init.el".source = ./emacs/init.el;
    }
    // (
      if pkgs.stdenv.isDarwin then
        {
          "Library/Application Support/Code/User/settings.json".source = ./vscode/settings.json;
          "Library/Application Support/Code/User/keybindings.json".source = ./vscode/keybindings.json;
        }
      else
        {
          ".config/Code/User/settings.json".source = ./vscode/settings.json;
          ".config/Code/User/keybindings.json".source = ./vscode/keybindings.json;
        }
    );
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
      enableInteractive = true;
      settings = {
        add_newline = false;
        scan_timeout = 10;
        character = {
          success_symbol = "➜";
          error_symbol = "➜";
        };
      };
    };
  };
}
