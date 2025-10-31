{ config, pkgs, ... }:
{
  programs.direnv.enable = true;
  programs.direnv.enableBashIntegration = true;
  programs.direnv.enableZshIntegration = true;
  programs.direnv.nix-direnv.enable = true;
}
