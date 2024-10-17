{ pkgs, lib, ... }:
let
  formatters =  lib.nixvim.mkRaw ''
    function()
      local check_biome_if_config_exists = vim.fn.filereadable(vim.fn.getcwd() .. "/biome.json")
      local check_biome_bin_exists = vim.fn.executable("biome")

      if check_biome_if_config_exists == 1 and check_biome_bin_exists == 1 then
        return { "biome", "prettierd", "prettier" }
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
