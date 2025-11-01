{
  pkgs ? import <nixpkgs> { },
}:
pkgs.mkShell {
  buildInputs = with pkgs; [
    gcc
    clang
    cmake
    make
    autoconf
    automake
    libtool
    gdb
    clang-tools
    cppcheck
    clang-tools
  ];
  shellHook = ''
    # 歡迎訊息
    echo ""
    echo "--------------------------------------------"
    echo "- Welcome to C/C++ development environment -"
    echo "--------------------------------------------"
    echo ""

    # 設定 CXXFLAGS 環境變數來指定 C++11 標準
    export CXXFLAGS="$CXXFLAGS -std=c++11"
  '';
}
