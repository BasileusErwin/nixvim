{ pkgs, ... }:
{
  extraPackages = [
    pkgs.prettierd
    pkgs.jq
    pkgs.stylua
    pkgs.shellcheck
    pkgs.nixfmt-rfc-style
  ];

  plugins.conform-nvim = {
    enable = true;
    formattersByFt = {
      # java = [ "google-java-format" ];
      # nasm = [ "asmfmt" ];
      # asm = [ "asmfmt" ];
      # c = [ "clang-format" ];
      # cpp = [ "clang-format" ];
      # cmake = [ "cmake-format" ];
      # make = [ "cmake-format" ];
      lua = [ "stylua" ];
      # python = [
      #   "isort"
      #   "black"
      # ];
      # javascript = [
      #   [
      #     "prettierd"
      #     "prettier"
      #   ]
      # ];
      # typescript = [
      #   [
      #     "prettierd"
      #     "prettier"
      #   ]
      # ];
      # rust = [ "rustfmt" ];
      json = [
        [
          "prettierd"
          "jq"
        ]
      ];
      # ocaml = [ "ocamlformat" ];
      # zig = [ "zigfmt" ];
      bash = [ "shellcheck" ];
      markdown = [ "prettierd" ];
      ignis = [ "trim_whitespace" ];
      nix = [ "nixfmt" ];
      "_" = [ "trim_whitespace" ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true, lsp_fallback = true })<CR>";
    }
  ];
}
