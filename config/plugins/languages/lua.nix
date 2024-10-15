{ pkgs, inputs, ... }:
{
  extraPackages = [
    pkgs.stylua
    pkgs.selene
    pkgs.lua-language-server
    pkgs.lua5_4
  ];

  extraPlugins = with pkgs.vimPlugins; [
    neodev-nvim
    neoconf-nvim
  ];

  extraConfigLuaPre = ''
    require('neoconf').setup()
    require('neodev').setup()
  '';

  plugins = {
    lsp.servers.lua_ls.enable = true;
    cmp.settings.sources = [ { name = "nvim_lua"; groupIndex = 0; } ];
    none-ls.sources = {
      formatting.stylua.enable = true;
      diagnostics.selene.enable = true;
    };
  };
}
