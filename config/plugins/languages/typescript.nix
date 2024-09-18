{ pkgs, ... }:
{
  extraPackages = [
    pkgs.prettierd
    pkgs.eslint_d
  ];

  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
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
