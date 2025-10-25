{
  config,
  pkgs,
  username,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./fonts
    ./vscode
  ];
  home.username = "${username}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    git
    nil
    nixfmt
    zsh
  ];
  programs.home-manager.enable = true;
}
