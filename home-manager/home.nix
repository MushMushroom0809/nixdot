{
  config,
  pkgs,
  username,
  ...
}:
{
  imports = [
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
      nerd-fonts.jetbrains-mono
      neofetch
      nixfmt-rfc-style
      ripgrep
      ripgrep-all
      uv
      zsh
    ];
  };
  fonts = {
    fontconfig = {
      enable = true;
    };
  };
  programs = {
    home-manager = {
      enable = true;
    };
  };
}
