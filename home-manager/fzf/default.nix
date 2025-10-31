{ config, pkgs, ... }:
{
  programs.fzf.enable = true;
  programs.fzf.enableBashIntegration = true;
  programs.fzf.enableZshIntegration = true;
  programs.fzf.defaultOptions = [
    "--height 50%"
    "--border"
  ];
}
