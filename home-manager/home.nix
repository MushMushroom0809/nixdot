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
    ./emacs
    ./yazi
    ./zsh
  ];
  home = {
    username = "${username}";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
    stateVersion = "25.05";
    packages = with pkgs; [
      btop
      fastfetch
      fzf
      lsd
      neofetch
      nixfmt-rfc-style
      ripgrep
      ripgrep-all
      tokei
      uv
    ];
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
