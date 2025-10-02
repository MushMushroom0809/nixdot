{ config, pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    extensions = with pkgs.vscode-extensions; [
      vscode-marketplace.ms-python.python
      vscode-marketplace.bbenoist.nix
      open-vsx.jnoortheen.nix-ide
    ];
    userSettings = {
      "editor.fontFamily" = "JetBrainsMono Nerd Font";
      "editor.fontLigatures" = true;
      # "workbench.colorTheme" = "Dracula";
    };
  };
}
