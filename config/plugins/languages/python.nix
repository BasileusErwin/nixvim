{
  plugins = {
    lsp.servers.pyright = {
      enable = true;
    };

    conform-nvim = {
      enable = true;
      formattersByFt.python = [
        "isort"
        "black"
      ];
    };
  };
}
