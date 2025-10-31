{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.noto
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
  ];
  fonts.fontconfig.enable = true;
  fonts.fontconfig.antialiasing = true;
  fonts.fontconfig.hinting = "full";
  fonts.fontconfig.subpixelRendering = "rgb";
  fonts.fontconfig.defaultFonts.serif = [
    "Noto Serif"
    "Noto Serif CJK TC"
  ];
  fonts.fontconfig.defaultFonts.sansSerif = [
    "Noto Sans"
    "Noto Sans CJK TC"
  ];
  fonts.fontconfig.defaultFonts.monospace = [
    "JetBrainsMono Nerd Font"
    "Noto Sans Mono CJK SC"
  ];
  fonts.fontconfig.defaultFonts.emoji = [
    "Noto Color Emoji"
    "Apple Color Emoji"
  ];
}
