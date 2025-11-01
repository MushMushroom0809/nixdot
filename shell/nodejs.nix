{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    nodejs_24
    yarn
    pnpm
  ];
  shellHook = ''
    echo ""
    echo "-------------------------------------------"
    echo "- Welcome to Node development environment -"
    echo "-------------------------------------------"
    echo ""
  '';
}
