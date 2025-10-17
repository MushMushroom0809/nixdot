{
  config,
  pkgs,
  username,
  ...
}:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowBroken = true;
    };
  };
  imports = [
    ./alacritty
    ./direnv
    ./emacs
    ./fonts
    ./helix
    ./git
    ./neovim
    ./tmux
    ./vim
    ./vscode
    ./zsh
  ];
  home = {
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      fastfetch
      lsd
      nil
      nixfmt-rfc-style
    ];
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
