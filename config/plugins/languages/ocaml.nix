{
  plugins = {
    lsp.servers.ocamllsp.enable = true;

    conform-nvim = {
      enable = true;
      formattersByFt.ocaml = [ "ocamlformat" ];
    };
  };
}
