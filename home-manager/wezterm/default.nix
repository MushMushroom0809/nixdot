{
  config,
  pkgs,
  ...
}:
{
  programs = {
    wezterm = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      extraConfig = ''
        local wezterm = require("wezterm")
        wezterm.on("gui-startup", function()
          local tab, pane, window = wezterm.mux.spawn_window{}
          window:gui_window():maximize()
        end)
        config = {}
        config.color_scheme = "Catppuccin Mocha"
        config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Bold", italic = false })
        config.font_size = 12.0
        config.front_end = "WebGpu"
        config.default_cursor_style = "BlinkingBlock"
      	config.cursor_blink_ease_in = "EaseIn"
      	config.cursor_blink_ease_out = "EaseOut"
      	config.animation_fps = 120
      	config.cursor_blink_rate = 800
      	config.cursor_thickness = 1.0
        return config
      '';
    };
  };
}
