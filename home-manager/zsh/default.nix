{
  config,
  pkgs,
  ...
}:
{
  programs = {
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting = {
        enable = true;
      };
      autosuggestion = {
        enable = true;
        highlight = "fg=magenta,bg=cyan,bold,underline";
        strategy = [
          "history"
          "completion"
          "match_prev_cmd"
        ];
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
      antidote = {
        enable = true;
      };
      oh-my-zsh = {
        enable = true;
        theme = "agnoster";
        plugins = [
          "git"
          "history"
          "common-aliases"
          "z"
          "sudo"
          "npm"
          "node"
          "python"
          "rust"
          "web-search"
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
        {
          name = "enhancd";
          file = "init.sh";
          src = pkgs.fetchFromGitHub {
            owner = "babarot";
            repo = "enhancd";
            rev = "v2.5.1";
            sha256 = "kaintLXSfLH7zdLtcoZfVNobCJCap0S/Ldq85wd3krI=";
          };
        }
      ];
    };
  };
}
