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
          rainbow-brackets = true;
          bufferline = "always";
          text-width = 80;
          rulers = [ 80 ];
          line-number = "relative";
          auto-save = true;
          statusline = {
            left = [
              "mode"
              "spacer"
              "version-control"
              "spinner"
              "read-only-indicator"
              "file-modification-indicator"
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
          cursor-shape = {
            insert = "bar";
          };
        };
        keys = {
          insert = {
            "j" = {
              "k" = "normal_mode";
            };
          };
        };
      };
    };
  };
}
