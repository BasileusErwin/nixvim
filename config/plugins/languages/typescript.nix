{ pkgs, lib, ... }:
let
  formatters =  lib.nixvim.mkRaw ''
    function()
      local check_biome_if_config_exists = vim.fn.filereadable(vim.fn.getcwd() .. "/biome.json")

      if check_biome_if_config_exists == 1 then
        return { "biome" }
      else
        return { "prettierd", "prettier" }
      end
    end
  '';
in
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
        javascript = formatters;
        typescript = formatters;
      };
    };
  };
}
