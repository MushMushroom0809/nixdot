{
  config,
  pkgs,
  ...
}:
{
  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 8;
            y = 8;
          };
          dynamic_padding = true;
          decorations = "Full";
          opacity = 0.95;
          blur = true;
          startup_mode = "Maximized";
          decorations_theme_variant = "Dark";
          resize_increments = true;
          option_as_alt = "OnlyLeft";
        };
        scrolling = {
          history = 10000;
          multiplier = 5;
        };
        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };
          size = 12.0;
        };
        bell = {
          animation = "EaseOut";
          duration = 3;
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "Always";
          };
          blink_interval = 1000;
          thickness = 0.2;
        };
        mouse = {
          hide_when_typing = true;
        };
      };
      theme = "catppuccin_mocha";
    };
  };
}
