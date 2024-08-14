{
  plugins = {
    lsp.servers.ltex = {
      enable = true;

      settings = {
        enabled = [
          "latex"
          "tex"
          "bib"
          "markdown"
          "gitcommit"
          "text"
          "org"
          "norg"
        ];
        language = "auto";
        dictionary = {
          "es" = [ ":/home/iperez/.config/nvim/dict/es" ];
        };
      };
    };
    none-ls.sources.diagnostics.markdownlint.enable = true;
  };
}
