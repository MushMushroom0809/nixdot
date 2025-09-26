{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    alacritty
  ];
  programs = {
    alacritty = {
      enable = true;
      settings = {
        window = {
          padding = {
            x = 8;
            y = 8;
          };
          opacity = 0.98;
          blur = true;
          startup_mode = "Maximized";
          option_as_alt = "OnlyLeft";
        };
        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font";
            style = "Bold";
          };
          size = 12.0;
        };
        cursor = {
          style = {
            shape = "Block";
            blinking = "Always";
          };
        };
      };
      theme = "tomorrow_night";
    };
  };
}
