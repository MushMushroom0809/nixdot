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
      curl
      direnv
      emacs
      fastfetch
      fzf
      go
      git
      just
      lazygit
      lsd
      mkalias
      nerd-fonts.hack
      nerd-fonts.ubuntu
      nerd-fonts.iosevka
      nerd-fonts.monaspace
      nerd-fonts.meslo-lg
      nerd-fonts.fira-mono
      nerd-fonts.blex-mono
      nerd-fonts.fira-code
      nerd-fonts.roboto-mono
      nerd-fonts.ubuntu-mono
      nerd-fonts.jetbrains-mono
      neofetch
      neovim
      nixfmt-rfc-style
      nodejs_24
      p7zip
      qemu
      qutebrowser
      ripgrep
      ripgrep-all
      ruby
      starship
      unzip
      uv
      wezterm
      wget
      wqy_zenhei
      wqy_microhei
      xz
      yazi
      zathura
      zig
      zip
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
