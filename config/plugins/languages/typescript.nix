{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    prettierd
    eslint_d
    biome
  ];

  plugins = {
    lsp.servers = {
      ts_ls.enable = true;
      biome.enable = true;
    };

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        javascript = [
          [
            "biome"
            "prettierd"
            "prettier"
          ]
        ];
        typescript = [
          [
            "biome"
            "prettierd"
            "prettier"
          ]
        ];
      };
    };
  };
}
