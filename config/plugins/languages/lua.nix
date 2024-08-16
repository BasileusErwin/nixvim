{ pkgs, ... }:
{
  extraPackages = [
    pkgs.stylua
    pkgs.selene
    pkgs.lua-language-server
    pkgs.lua5_4
  ];

  extraPlugins = [
    pkgs.vimPlugins.neoconf-nvim
    pkgs.vimPlugins.lazydev-nvim
  ];

  extraConfigLuaPre = ''
    require('neoconf').setup()
    require('lazydev').setup()
  '';

  plugins = {
    lsp.servers.lua-ls.enable = true;
    cmp.settings.sources = [ { name = "lazydev"; } ];
    none-ls.sources = {
      formatting.stylua.enable = true;
      diagnostics.selene.enable = true;
    };
  };
}
