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
        theme = "funky";
        plugins = [
          "git"
          "history"
        ];
      };
    };
  };
}
