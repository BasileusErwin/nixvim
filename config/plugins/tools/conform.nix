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
    settings.formatters_by_ft = {
      # java = [ "google-java-format" ];
      lua = [ "stylua" ];
      json = [
        [
          "prettierd"
          "jq"
        ]
      ];
      markdown = [ "prettierd" ];
      ignis = [
        "squeeze_blanks"
        "trim_whitespace"
        "trim_newlines"
      ];
      nix = [ "nixfmt" ];
      "_" = [
        "squeeze_blanks"
        "trim_whitespace"
        "trim_newlines"
      ];
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format({ async = true })<CR>";
      options = {
        desc = "Format code";
      };
    }
  ];
}
