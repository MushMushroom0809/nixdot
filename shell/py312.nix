{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    python312
    uv
  ];
  shellHook = ''
    echo "python 3.12 develop environment"
  '';
}
