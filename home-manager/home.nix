{
  config,
  pkgs,
  username,
  ...
}:
{
  nixpkgs.config.allowUnfree = true;
  imports = [
    ./alacritty
    ./direnv
    ./emacs
    ./fonts
    ./fzf
    ./helix
    ./lsd
    ./neovim
    ./ripgrep
    ./tmux
    ./vim
    ./vscode
    ./zsh
  ];
  home.username = "${username}";
  home.homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
  home.stateVersion = "25.05";
  home.packages = with pkgs; [
    nixfmt
  ];
  programs.home-manager.enable = true;
}
