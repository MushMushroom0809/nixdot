{ config, pkgs, ... }:
{
  programs.ripgrep.enable = true;
  programs.ripgrep.arguments = [
    "--max-columns-preview"
    "--colors=line:style:bold"
  ];
  programs.ripgrep-all.enable = true;
}
