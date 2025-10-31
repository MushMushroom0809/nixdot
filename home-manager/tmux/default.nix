{ config, pkgs, ... }:
{
  programs.tmux.enable = true;
  programs.tmux.aggressiveResize = true;
  programs.tmux.baseIndex = 1;
  programs.tmux.escapeTime = 250;
  programs.tmux.historyLimit = 1000;
  programs.tmux.keyMode = "emacs";
  programs.tmux.mouse = true;
  programs.tmux.newSession = false;
  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    cpu
  ];
  programs.tmux.prefix = "C-b";
  programs.tmux.resizeAmount = 3;
  programs.tmux.terminal = "screen-256color";
  programs.tmux.extraConfig = ''
    set -g status-bg black
    set -g status-fg white
    set -g status-interval 5
    set -g status-left-length 100
    set -g status-left " #[bold,fg=green]#S #[fg=white]| #[fg=cyan]#W #[fg=white]| #[fg=yellow]#P "
    set -g status-right-length 100
    set -g status-right " #[fg=colour39,bold] #(${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/scripts/cpu_percentage.sh) #[fg=white]| #[fg=colour45,bold] #(${pkgs.tmuxPlugins.cpu}/share/tmux-plugins/cpu/scripts/ram_percentage.sh) "
  '';
}
