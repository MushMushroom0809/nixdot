{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    R
    rstudio
    rPackages.brms
    rPackages.caret
    rPackages.data_table
    rPackages.devtools
    rPackages.dplyr
    rPackages.e1071
    rPackages.faraway
    rPackages.forecast
    rPackages.ggplot2
    rPackages.glmnet
    rPackages.glmnetUtils
    rPackages.languageserver
    rPackages.lme4
    rPackages.mgcv
    rPackages.nnet
    rPackages.randomForest
    rPackages.rpart
    rPackages.rstan
    rPackages.survival
    rPackages.tidyr
    rPackages.tidyverse
    rPackages.tune
    rPackages.xgboost
  ];
  shellHook = ''
    echo ""
    echo "----------------------------------------"
    echo "- Welcome to R development environment -"
    echo "----------------------------------------"
    echo ""
    echo "[HINT] Use 'rstudio >/dev/null 2>&1' to launch RStudio."
    echo ""
  '';
}
