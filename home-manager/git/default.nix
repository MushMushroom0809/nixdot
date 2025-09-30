{
  config,
  pkgs,
  ...
}:
{
  programs = {
    git = {
      enable = true;
      userName = "MushMushroom0809";
      userEmail = "cya.chen.ya@gmail.com";
      delta = {
        enable = true;
        options = {
          side-by-side = true;
          line-numbers = true;
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
          };
          features = "decorations";
        };
      };
    };
  };
};
