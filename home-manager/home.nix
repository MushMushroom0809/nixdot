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
    ./fonts
    ./git
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
