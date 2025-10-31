{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    emacs
  ];
  home.file.".emacs".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixdot/home-manager/emacs/init.el";
}
