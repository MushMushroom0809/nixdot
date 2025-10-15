{
  config,
  pkgs,
  ...
}:
{
  programs = {
    helix = {
      enable = true;
      defaultEditor = false;
      settings = {
        theme = "github_dark_high_contrast";
        editor = {
          bufferline = "always";
          text-width = 80;
          rulers = [ 80 ];
          line-number = "relative";
          auto-save = true;
          true-color = true;
          color-modes = true;
          statusline = {
            left = [
              "mode"
              "spacer"
              "version-control"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
            ];
            center = [
              "workspace-diagnostics"
            ];
            right = [
              "file-type"
              "position"
              "total-line-numbers"
              "position-percentage"
              "file-encoding"
              "file-line-ending"
            ];
            mode = {
              normal = "NORMAL";
              insert = "INSERT";
              select = "SELECT";
            };
          };
          indent-guides = {
            render = true;
          };
          inline-diagnostics = {
            cursor-line = "warning";
          };
          cursor-shape = {
            insert = "bar";
          };
        };
        keys = {
          normal = {
            "v" = [
              "collapse_selection"
              "select_mode"
            ];
            "V" = [
              "select_mode"
              "extend_to_line_bounds"
            ];
            "0" = "goto_line_start";
            "$" = "goto_line_end";
            "%" = "match_brackets";
            "G" = "goto_file_end";
            "x" = "delete_selection";
            "p" = [
              "paste_clipboard_after"
              "collapse_selection"
            ];
            "P" = [
              "paste_clipboard_before"
              "collapse_selection"
            ];
            "esc" = [
              "collapse_selection"
              "keep_primary_selection"
            ];
            "d" = {
              "d" = [
                "extend_to_line_bounds"
                "yank_main_selection_to_clipboard"
                "delete_selection"
              ];
            };
            "y" = {
              "y" = [
                "extend_to_line_bounds"
                "yank_main_selection_to_clipboard"
                "normal_mode"
                "collapse_selection"
              ];
            };
          };
          insert = {
            "j" = {
              "k" = "normal_mode";
            };
            "esc" = [
              "collapse_selection"
              "normal_mode"
            ];
          };
          select = {
            "0" = "goto_line_start";
            "$" = "goto_line_end";
            "G" = "goto_file_end";
            "x" = [
              "yank_main_selection_to_clipboard"
              "delete_selection"
            ];
            "y" = [
              "yank_main_selection_to_clipboard"
              "normal_mode"
              "flip_selections"
              "collapse_selection"
            ];
            "esc" = [
              "collapse_selection"
              "keep_primary_selection"
              "normal_mode"
            ];
          };
        };
      };
    };
  };
}
