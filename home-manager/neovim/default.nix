{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    neovim
  ];
  home.file.".config/nvim/init.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixdot/home-manager/neovim/init.lua";
}
