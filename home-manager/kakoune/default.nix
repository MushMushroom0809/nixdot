{
  config,
  pkgs,
  ...
}:
{
  programs = {
    kakoune = {
      enable = true;
      colorSchemePackage = with pkgs; [
        kakounePlugins.kakoune-catppuccin
      ];
      config = {};
    };
  };
}
