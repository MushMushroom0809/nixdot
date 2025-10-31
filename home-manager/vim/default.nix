{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    vim
  ];
  home.file.".vimrc".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixdot/home-manager/vim/init.vim";
}
