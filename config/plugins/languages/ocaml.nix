{
  plugins = {
    lsp.servers.ocamllsp.enable = true;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.ocaml = [ "ocamlformat" ];
    };
  };
}
