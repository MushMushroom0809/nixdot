{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    nerd-fonts.noto
    nerd-fonts.mononoki
    nerd-fonts.hack
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-color-emoji
    source-sans
    source-serif
    source-han-sans
    source-han-serif
    source-han-mono
    lxgw-wenkai
    lxgw-neoxihei
    lxgw-wenkai-tc
    lxgw-wenkai-screen
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
