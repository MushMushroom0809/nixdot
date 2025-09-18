{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    emacs
  ];
  home.file.".emacs.d/init.el".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nixdot/home-manager/emacs/init.el";
}
