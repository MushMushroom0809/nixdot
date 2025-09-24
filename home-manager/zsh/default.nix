{ pkgs, ... }:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion = {
        enable = true;
      };
      syntaxHighlighting = {
        enable = true;
      };
      autosuggestion = {
        highlight = "fg=#ff00ff,bg=cyan,bold,underline";
        strategy = [ "history" "completion" "match_prev_cmd"];
      };
      shellAliases = {
        ls = "lsd";
        ff = "fastfetch";
        vim = "emacs -nw";
        tree = "lsd -al --tree";
      };
      history = {
        path = "$HOME/.cache/zsh/history";
      };
      oh-my-zsh = {
        enable = true;
        theme = "theunraveler";
        plugins = [
          "git"
          "history"
        ];
      };
      plugins = [
        {
          name = "zsh-nix-shell";
          file = "nix-shell.plugin.zsh";
          src = pkgs.fetchFromGitHub {
            owner = "chisui";
            repo = "zsh-nix-shell";
            rev = "v0.8.0";
            sha256 = "1lzrn0n4fxfcgg65v0qhnj7wnybybqzs4adz7xsrkgmcsr0ii8b7";
          };
        }
      ];
    };
  };
}
