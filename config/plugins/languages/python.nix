{
  plugins = {
    lsp.servers.pyright = {
      enable = true;
    };

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.python = [
        "isort"
        "black"
      ];
    };
  };
}
