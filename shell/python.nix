{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    uv
  ];
  shellHook = ''
    echo ""
    echo "---------------------------------------------"
    echo "- Welcome to Python development environment -"
    echo "---------------------------------------------"
    echo ""
  '';
}
