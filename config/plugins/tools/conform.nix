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
      lua = [ "stylua" ];
      json = [
        [
          "prettierd"
          "jq"
        ]
      ];
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
      action = "<cmd>lua require('conform').format({ async = true })<CR>";
      options = {
        desc = "Format code";
      };
    }
  ];
}
