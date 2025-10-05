{
  config,
  pkgs,
  ...
}:
{
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.vscode-extensions; [
          aaron-bond.better-comments
          arrterian.nix-env-selector
          bbenoist.nix
          formulahendry.code-runner
          github.github-vscode-theme
          gruntfuggly.todo-tree
          jgclark.vscode-todo-highlight
          jnoortheen.nix-ide
          jeff-hykin.better-nix-syntax
          llvm-vs-code-extensions.vscode-clangd
          mechatroner.rainbow-csv
          ms-python.black-formatter
          ms-python.debugpy
          ms-python.flake8
          ms-python.isort
          ms-python.python
          ms-python.pylint
          ms-python.mypy-type-checker
          ms-python.vscode-pylance
          ms-toolsai.jupyter
          ms-toolsai.jupyter-renderers
          ms-toolsai.jupyter-keymap
          ms-toolsai.vscode-jupyter-slideshow
          ms-toolsai.vscode-jupyter-cell-tags
          vscodevim.vim
          yzhang.markdown-all-in-one
        ];
        userSettings = {
          "editor.fontSize" = 15;
          "editor.fontFamily" = "JetBrainsMono Nerd Font";
          "editor.fontLigatures" = true;
          "extensions.experimental.affinity" = {
            "vscodevim.vim" = 1;
          };
          "window.zoomLevel" = -0.75;
          "workbench.colorTheme" = "GitHub Dark Default";
          "vim.highlightedyank.enable" = true;
          "vim.hlsearch" = true;
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
        };
        keybindings = [
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
        ];
      };
    };
  };
}
