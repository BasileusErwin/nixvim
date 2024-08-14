{
  plugins = {
    lsp.servers.zls.enable = true;

    conform-nvim = {
      enable = true;
      formattersByFt.zig = [ "zigfmt" ];
    };
  };
}
