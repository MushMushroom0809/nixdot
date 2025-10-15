{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    pnpm
    yarn
  ];
  shellHook = ''
    echo "nodejs24 develop environment"
  '';
}
