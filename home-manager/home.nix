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
      direnv
      emacs
      fastfetch
      fzf
      go
      git
      lsd
      nerd-fonts.jetbrains-mono
      neofetch
      nixfmt-rfc-style
      ripgrep
      ripgrep-all
      uv
      zsh
    ];
  };
  imports = [
    ./emacs
  ];
  fonts = {
    fontconfig = {
      enable = true;
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
        vim = "emacs -nw";
        tree = "lsd -al --tree";
      };
    };
  };
}
