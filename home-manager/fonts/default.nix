{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.victor-mono
    wqy_zenhei
    wqy_microhei
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
