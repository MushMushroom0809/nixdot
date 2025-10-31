{ config, pkgs, ... }:
{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.autosuggestion.highlight = "fg=green,bg=black,bold,underline";
  programs.zsh.autosuggestion.strategy = [
    "history"
    "completion"
    "match_prev_cmd"
  ];
  programs.zsh.defaultKeymap = "emacs";
  programs.zsh.oh-my-zsh.enable = true;
  programs.zsh.oh-my-zsh.plugins = [
    "git"
    "sudo"
  ];
  programs.zsh.oh-my-zsh.theme = "af-magic";
  programs.zsh.plugins = [
    {
      name = "enhancd";
      file = "init.sh";
      src = pkgs.fetchFromGitHub {
        owner = "b4b4r07";
        repo = "enhancd";
        rev = "v2.2.1";
        sha256 = "0iqa9j09fwm6nj5rpip87x3hnvbbz9w9ajgm6wkrd5fls8fn8i5g";
      };
    }
    {
      name = "zsh-syntax-highlighting";
      src = pkgs.fetchFromGitHub {
        owner = "zsh-users";
        repo = "zsh-syntax-highlighting";
        rev = "0.8.0";
        sha256 = "iJdWopZwHpSyYl5/FQXEW7gl/SrKaYDEtTH9cGP7iPo=";
      };
    }
  ];
}
