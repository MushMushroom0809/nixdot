{ config, pkgs, ... }:
{
  programs.alacritty.enable = true;
  programs.alacritty.settings.window.padding.x = 8;
  programs.alacritty.settings.window.padding.y = 8;
  programs.alacritty.settings.window.opacity = 0.95;
  programs.alacritty.settings.window.blur = true;
  programs.alacritty.settings.window.startup_mode = "Maximized";
  programs.alacritty.settings.window.resize_increments = true;
  programs.alacritty.settings.window.option_as_alt = "OnlyLeft";
  programs.alacritty.settings.font.normal.family = "JetBrainsMono Nerd Font";
  programs.alacritty.settings.font.normal.style = "Regular";
  programs.alacritty.settings.font.bold.family = "JetBrainsMono Nerd Font";
  programs.alacritty.settings.font.bold.style = "Bold";
  programs.alacritty.settings.font.size = 12.0;
  programs.alacritty.settings.font.offset.x = 0;
  programs.alacritty.settings.font.offset.y = 4;
  programs.alacritty.settings.bell.animation = "EaseOut";
  programs.alacritty.settings.bell.duration = 3;
  programs.alacritty.settings.cursor.style.shape = "Block";
  programs.alacritty.settings.cursor.style.blinking = "Always";
  programs.alacritty.settings.keyboard.bindings = [
    {
      key = "c";
      mods = "Control|Shift";
      command = "Copy";
    }
    {
      key = "v";
      mods = "Control|Shift";
      command = "Paste";
    }
  ];
  programs.alacritty.theme = "vscode";
}
