{
  # TODO: install ocamllsp from opam
  plugins = {
    lsp.servers.ocamllsp = {
      enable = false;
    };

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.ocaml = [ "ocamlformat" ];
    };
  };
}
