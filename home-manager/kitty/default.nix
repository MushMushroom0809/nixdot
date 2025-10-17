{
  config,
  pkgs,
  ...
}:
{
  programs = {
    kitty = {
      enable = true;
      enableGitIntegration = true;
      font = {
        name = "RobotoMono Nerd Font";
        size = 12.0;
      };
      settings = {
        "cursor_trail" = 1;
        "cursor_trail_decay" = "0.1 0.4";
        "cursor_trail_start_threshold" = 2;
        "cursor_shape" = "block";
        "cursor_stop_blinking_after" = 0;
        "confirm_os_window_close" = 0;
        "scrollback_lines" = 10000;
        "enable_audio_bell" = false;
        "visual_bell_duration" = "0.1";
        "window_alert_on_bell" = true;
        "bell_on_tab" = true;
        "remember_window_size" = true;
        "enabled_layouts" = "Tall";
        "window_border_width" = "0.0";
        "draw_minimal_borders" = true;
        "window_margin_width" = "0.0";
        "window_padding_width" = "5.0";
        "inactive_text_alpha" = "0.8";
        "tab_bar_margin_width" = "0.0";
        "tab_bar_style" = "powerline";
        "tab_separator" = " ┇ ";
        "allow_remote_control" = true;
        "shell_integration" = "enabled";
        "clipboard_control" = "write-clipboard write-primary read-clipboard read-primary";
        "term" = "xterm-kitty";
        "ssh_env" = "TERM=xterm-256color";
        "share_connections" = true;
        "remote_kitty" = "if-needed";
        "copy_on_select" = false;
        "paste_actions" = "quote-urls-at-prompt";
        "strip_trailing_spaces" = "smart";
        "background_opacity" = "0.95";
        "hide_window_decorations" = false;
      };
      shellIntegration = {
        enableBashIntegration = true;
        enableZshIntegration = true;
      };
      themeFile = "Catppuccin-Mocha";
    };
  };
}
