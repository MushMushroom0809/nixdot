{
  config,
  pkgs,
  ...
}:
{
  programs = {
    kakoune = {
      enable = true;
      colorSchemePackage = pkgs.kakounePlugins.kakoune-catppuccin;
      plugins = with pkgs; [
        kakounePlugins.kak-fzf
      ];
      config = {
        autoComplete = [
          "insert"
          "prompt"
        ];
        autoInfo = [
          "command"
          "onkey"
        ];
        autoReload = "yes";
        colorScheme = "catppuccin_mocha";
        indentWidth = 2;
        numberLines = {
          enable = true;
          highlightCursor = true;
          relative = true;
        };
        scrollOff = {
          columns = 2;
          lines = 2;
        };
        showMatching = true;
        showWhitespace = {
          enable = true;
        };
        ui = {
          enableMouse = true;
          assistant = "cat";
          changeColors = true;
          statusLine = "bottom";
        };
      };
    };
  };
}
