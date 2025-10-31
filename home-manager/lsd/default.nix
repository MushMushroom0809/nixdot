{ config, pkgs, ... }:
{
  programs.lsd.enable = true;
  programs.lsd.enableBashIntegration = true;
  programs.lsd.enableZshIntegration = true;
}
