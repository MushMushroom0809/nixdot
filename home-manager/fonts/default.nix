{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    google-fonts
    nerd-fonts.hack
    nerd-fonts.jetbrains-mono
    nerd-fonts.mononoki
    nerd-fonts.monaspace
    nerd-fonts.meslo-lg
    nerd-fonts.noto
    nerd-fonts.ubuntu
    nerd-fonts.ubuntu-mono
    nerd-fonts.ubuntu-sans
    nerd-fonts.terminess-ttf
    nerd-fonts.roboto-mono
    nerd-fonts.victor-mono
    nerd-fonts.zed-mono
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
