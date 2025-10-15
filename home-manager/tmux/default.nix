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
        tmuxPlugins.catppuccin
        tmuxPlugins.net-speed
      ];
      extraConfig = ''
        set -g @catppuccin_flavour 'Mocha'
        set -g status-right "#{cpu_icon} #{cpu_percentage} | #{net_speed_icon} ↓#{net_speed_down} ↑#{net_speed_up} | %Y-%m-%d %H:%M"
      '';
    };
  };
}

