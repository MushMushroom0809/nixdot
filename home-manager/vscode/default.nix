{ config, pkgs, ... }:
{
  programs.vscode.enable = true;
  programs.vscode.profiles.default.extensions = with pkgs.vscode-extensions; [
    catppuccin.catppuccin-vsc
    catppuccin.catppuccin-vsc-icons
    jgclark.vscode-todo-highlight
    jnoortheen.nix-ide
    llvm-vs-code-extensions.vscode-clangd
    mechatroner.rainbow-csv
    ms-python.black-formatter
    ms-python.debugpy
    ms-python.python
    ms-python.vscode-pylance
    ms-toolsai.datawrangler
    ms-toolsai.jupyter
    ms-toolsai.jupyter-keymap
    ms-toolsai.jupyter-renderers
    ms-toolsai.vscode-jupyter-cell-tags
    ms-toolsai.vscode-jupyter-slideshow
    redhat.vscode-xml
    redhat.vscode-yaml
    tamasfe.even-better-toml
    vscodevim.vim
    zainchen.json
  ];
  programs.vscode.profiles.default.userSettings = {
    "editor.fontFamily" = "JetBrainsMono Nerd Font";
    "editor.fontSize" = 14;
    "editor.guides.bracketPairs" = true;
    "editor.lineNumbers" = "relative";
    "editor.minimap.enabled" = false;
    "extensions.experimental.affinity" = {
      "vscodevim.vim" = 1;
    };
    "window.zoomLevel" = -0.56;
    "workbench.colorTheme" = "Catppuccin Mocha";
    "workbench.iconTheme" = "catppuccin-mocha";
    "workbench.startupEditor" = "none";
    "vim.highlightedyank.enable" = true;
    "vim.hlsearch" = true;
    "vim.sneak" = true;
    "vim.surround" = true;
    "vim.scroll" = 20;
    "vim.easymotion" = true;
    "vim.easymotionKeys" = "asdfghjkl;";
    "vim.camelCaseMotion.enable" = true;
    "vim.leader" = " ";
    "vim.insertModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "j"
          "k"
        ];
        "after" = [
          "<Esc>"
        ];
      }
    ];
    "vim.visualModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "j"
          "k"
        ];
        "after" = [
          "<Esc>"
        ];
      }
    ];
    "vim.commandLineModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "j"
          "k"
        ];
        "after" = [
          "<Esc>"
        ];
      }
    ];
    "vim.normalModeKeyBindingsNonRecursive" = [
      {
        "before" = [
          "K"
        ];
        "commands" = [
          "editor.action.showHover"
        ];
      }
      {
        "before" = [
          "g"
          "d"
        ];
        "commands" = [
          "editor.action.revealDefinition"
        ];
      }
    ];
    "vim.useSystemClipboard" = true;
    "vim.cursorStylePerMode.normal" = "block";
    "vim.cursorStylePerMode.insert" = "line";
    "vim.cursorStylePerMode.visual" = "block-outline";
    "vim.cursorStylePerMode.visualline" = "block-outline";
    "vim.cursorStylePerMode.visualblock" = "block-outline";
    "vim.cursorStylePerMode.replace" = "block-outline";
    "catppuccin.accentColor" = "blue";
    "catppuccin.colorOverrides" = {
      "mocha" = {
        "base" = "#11111b";
        "mantle" = "#11111b";
      };
    };
    "catppuccin.italicComments" = true;
    "catppuccin.italicKeywords" = true;
    "catppuccin.boldKeywords" = true;
    "catppuccin.workbenchMode" = "default";
    "catppuccin.bracketMode" = "rainbow";
    "catppuccin.customUIColors" = {
      "mocha" = {
        "editorLineNumber.activeForeground" = "green";
        "editorLineNumber.foreground" = "surface1";
        "editorSuggestWidget.border" = "blue";
        "widget.border" = "accent";
      };
    };
    "catppuccin.extraBordersEnabled" = true;
    "catppuccin.syncWithIconPack" = true;
    "catppuccin-icons.hidesExplorerArrows" = true;
    "catppuccin-icons.specificFolders" = true;
    "catppuccin-icons.monochrome" = false;
    "catppuccin-icons.associations.extensions" = { };
    "catppuccin-icons.associations.files" = { };
    "catppuccin-icons.associations.folders" = { };
    "catppuccin-icons.associations.languages" = { };
  };
  programs.vscode.profiles.default.keybindings = [
    {
      "key" = "ctrl+h";
      "command" = "workbench.action.navigateLeft";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+l";
      "command" = "workbench.action.navigateRight";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+k";
      "command" = "workbench.action.navigateUp";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+j";
      "command" = "workbench.action.navigateDown";
      "when" = "editorTextFocus";
    }
    {
      "key" = "ctrl+shift+t";
      "command" = "workbench.action.createTerminalEditor";
    }
  ];
}
