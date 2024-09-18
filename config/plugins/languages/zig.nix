{
  plugins = {
    lsp.servers.zls.enable = true;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.zig = [ "zigfmt" ];
    };
  };
}
