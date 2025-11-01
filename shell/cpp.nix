{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    clang
    cmake
    gnumake
    autoconf
    automake
    libtool
    gdb
    clang-tools
    cppcheck
    clang-tools
  ];
  shellHook = ''
    echo ""
    echo "--------------------------------------------"
    echo "- Welcome to C/C++ development environment -"
    echo "--------------------------------------------"
    echo ""
    export CXXFLAGS="$CXXFLAGS -std=c++11"
  '';
}
