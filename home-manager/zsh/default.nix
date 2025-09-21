{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "lsd";
        ff = "fastfetch";
        vim = "emacs -nw";
        tree = "lsd -al --tree";
      };
    };
  };
}
