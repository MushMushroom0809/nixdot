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
          decorations = {
            commit-decoration-style = "bold yellow box ul";
            file-decoration-style = "none";
            file-style = "bold yellow ul";
          };
          features = "decorations";
          whitespace-error-style = "22 reverse";
        };
      };
      extraConfig = {
        core = {
          whitespace = "trailing-space,space-before-tab";
        };
      };
      ignores = [
        "*.elc"
        "*.eln"
        "*.swp"
      ];
    };
  };
}
