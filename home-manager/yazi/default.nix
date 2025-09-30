{
  config,
  pkgs,
  ...
}:
{
  programs = {
    yazi = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      settings = {
        mgr = {
          show_hidden = true;
          sort_by = "mtime";
          sort_dir_first = true;
        };
      };
    };
  };
}
