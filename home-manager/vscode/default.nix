{ config, pkgs, ... }:
{
  programs.vscode.enable = true;
  programs.vscode.profiles.default.enableExtensionUpdateCheck = false;
  programs.vscode.profiles.default.enableUpdateCheck = false;
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    mkhl.direnv
    ms-python.python
    ms-python.debugpy
    ms-python.pylint
    ms-python.flake8
    ms-python.mypy-type-checker
    ms-python.vscode-pylance
    ms-python.isort
    ms-python.black-formatter
    ms-toolsai.jupyter
    ms-toolsai.vscode-jupyter-slideshow
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.jupyter-renderers
    ms-toolsai.jupyter-keymap
    redhat.vscode-yaml
    redhat.vscode-xml
    tamasfe.even-better-toml
    vscodevim.vim
    yzhang.markdown-all-in-one
  ];
  programs.vscode.profiles.default.keybindings = [
    {
      "key" = "ctrl+shift+t";
      "command" = "workbench.action.createTerminalEditor";
    }
    {
      "key" = "ctrl+h";
      "command" = "workbench.action.focusLeftGroup";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+l";
      "command" = "workbench.action.focusRightGroup";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+k";
      "command" = "workbench.action.focusAboveGroup";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+j";
      "command" = "workbench.action.focusBelowGroup";
      "when" = "editorTextFocus";
    }
  ];
  programs.vscode.profiles.default.userSettings = {
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontSize" = 14;
    "editor.minimap.enabled" = false;
    "window.zoomLevel" = -0.56;
    "vim.highlightedyank.enable" = true;
    "vim.hlsearch" = true;
    "vim.useSystemClipboard" = true;
    "vim.insertModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "j"
          "k"
        ];
        "after" = [ "<Esc>" ];
      }
    ];
    "vim.normalModeKeyBindingsNonRecursive" = [
      {
        "before" = [ "K" ];
        "commands" = [ "editor.action.showHover" ];
      }
      {
        "before" = [
          "g"
          "d"
        ];
        "commands" = [ "editor.action.revealDefinition" ];
      }
    ];
  };
}
