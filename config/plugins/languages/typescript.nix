{ pkgs, ... }:
{
  extraPackages = [
    pkgs.prettierd
    pkgs.eslint_d
  ];

  plugins = {
    lsp.servers = {
      tsserver.enable = true;
    };

    conform-nvim = {
      enable = true;
      formattersByFt = {
        javascript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "prettierd"
            "prettier"
          ]
        ];
      };
    };
  };
}
