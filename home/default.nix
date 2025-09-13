{ pkgs, username, ... }:
{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."${username}" = {
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
        lazygit
        lsd
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
        vim
        starship
        unzip
        uv
        wezterm
        wget
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
        ".vim/vimrc".source = ./vim/vimrc;
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
      };
    };
  };
}
