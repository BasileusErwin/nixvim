{
  plugins = {
    lsp = {
      servers = {
        nixd.enable = true;
      };
    };

    none-ls = {
      enable = true;
      sources = {
        formatting.alejandra.enable = true;
        diagnostics.statix.enable = true;
        code_actions.statix.enable = true;
      };
    };

  };
}
