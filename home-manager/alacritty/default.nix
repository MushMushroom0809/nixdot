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
          opacity = 0.98;
          blur = true;
          startup_mode = "Maximized";
          dynamic_title = true;
          decorations_theme_variant = "Dark";
          option_as_alt = "OnlyLeft";
        };
        scrolling = {
          history = 2000;
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
          italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };
          bold_italic = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };
          size = 12.0;
          offset = {
            x = 1;
            y = 4;
          };
        };
        bell = {
          animation = "EaseOutCubic";
          duration = 200;
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "Always";
          };
          blink_interval = 1000;
          unfocused_hollow = true;
          thickness = 0.3;
        };
        mouse = {
          hide_when_typing = true;
        };
      };
      theme = "github_dark_high_contrast";
    };
  };
}
