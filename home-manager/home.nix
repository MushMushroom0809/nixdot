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
    };
  };
  imports = [
    ./alacritty
    ./direnv
    ./fonts
    ./git
    ./neovim
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
      uv
    ];
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
