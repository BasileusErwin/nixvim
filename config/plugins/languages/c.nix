{ pkgs, ... }:
{

  extraPackages = [
    pkgs.clang
    pkgs.clang-tools
    pkgs.cmake
    pkgs.cmake-format
    pkgs.checkmake
    pkgs.nasm
    pkgs.gcc
  ];

  plugins = {
    lsp.servers.clangd.enable = true;

    conform-nvim = {
      enable = true;

      settings.formatters_by_ft = {
        nasm = [ "asmfmt" ];
        asm = [ "asmfmt" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        cmake = [ "cmake-format" ];
        make = [ "cmake-format" ];
      };
    };

    none-ls.sources.diagnostics = {
      checkmake.enable = true;
      cmake_lint.enable = true;
    };
  };
}
