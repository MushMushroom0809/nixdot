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
    ./fonts
    ./emacs
    ./zsh
  ];
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
