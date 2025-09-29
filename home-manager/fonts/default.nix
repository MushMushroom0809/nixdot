{ pkgs, ... }:
{
  home.packages = with pkgs.nerd-fonts; [
    hack
    jetbrains-mono
    noto
    ubuntu
    ubuntu-mono
    victor-mono
  ];
  fonts = {
    fontconfig = {
      enable = true;
      antialiasing = true;
      hinting = "full";
      subpixelRendering = "rgb";
    };
  };
}
