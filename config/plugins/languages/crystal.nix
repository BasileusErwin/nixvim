{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-crystal
  ];

  plugins = {
    lsp.servers.crystalline.enable = true;
    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.crystal = [ "crystalline" ];
    };
  };

}
