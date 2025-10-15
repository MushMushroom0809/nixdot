{
  config,
  pkgs,
  ...
}:
{
  programs = {
    tmux = {
      enable = true;
      aggressiveResize = true;
      baseIndex = 1;
      clock24 = true;
      escapeTime = 1000;
      historyLimit = 5000;
      keyMode = "emacs";
      mouse = true;
      prefix = "C-b";
      terminal = "screen-256color";
      tmuxinator = {
        enable = true;
      };
      plugins = with pkgs; [
        tmuxPlugins.cpu
        tmuxPlugins.net-speed
        tmuxPlugins.catppuccin
      ];
      extraConfig = ''
        set -g set-titles-string "#S:#I:#W"
        set -g status-right-length 100
        set -g status-left-length 100
        set -g status-left ""
        set -g status-right "#[fg=#94e2d5]#{E:@catppuccin_status_left_separator}#[fg=#11111b,bg=#94e2d5]󰈀  #{E:@catppuccin_status_middle_separator}#[fg=#cdd6f4,bg=#313244] #(${pkgs.tmuxPlugins.net-speed}/share/tmux-plugins/net-speed/scripts/net_speed.sh)#[fg=#313244]#{E:@catppuccin_status_right_separator}"
        set -ag status-right "#[fg=#f9e2af]#{E:@catppuccin_status_left_separator}#[fg=#11111b,bg=#f9e2af]#{E:@catppuccin_cpu_icon} #{E:@catppuccin_status_middle_separator}#[fg=#cdd6f4,bg=#313244] #(${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/scripts/cpu_percentage.sh)#[fg=#313244]#{E:@catppuccin_status_right_separator}"
        set -g @catppuccin_ram_icon " "
        set -ag status-right "#[fg=#cba6f7]#{E:@catppuccin_status_left_separator}#[fg=#11111b,bg=#cba6f7]  #{E:@catppuccin_status_middle_separator}#[fg=#cdd6f4,bg=#313244] #(${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/scripts/ram_percentage.sh)#[fg=#313244]#{E:@catppuccin_status_right_separator}"
        set -g @catppuccin_flavor 'mocha'
        set -g @catppuccin_window_status_style "rounded"
        set -g status-bg default
        set -g message-style "fg=#94e2d5,bg=default"
        set -g message-command-style "fg=#94e2d5,bg=default"
        set -g @catppuccin_window_left_separator ""
        set -g @catppuccin_window_right_separator " "
        set -g @catppuccin_window_middle_separator " █"
        set -g @catppuccin_window_number_position "right"
        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#{window_name}"
        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#{window_name}"
      '';
    };
  };
}
