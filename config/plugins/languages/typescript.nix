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
      settings.formatters_by_ft = {
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
