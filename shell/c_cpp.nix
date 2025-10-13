{ pkgs }:
pkgs.mkShell {
  buildInputs = with pkgs; [
    clang_17
    gcc
    gdb
    cmake
    ninja
    clang-tools
    pkg-config
  ];
  shellHook = ''
    echo "C and C++ develop environment"
    export CC="clang"
    export CXX="clang++"
  '';
}
