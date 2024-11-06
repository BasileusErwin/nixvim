{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    ocamlPackages.ocamlformat
    ocamlPackages.merlin
  ];

  plugins = {
    lsp.servers.ocamllsp = {
      enable = true;
      package = pkgs.ocamlPackages.ocaml-lsp;
    };

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.ocaml = [ "ocamlformat" ];
    };
  };
}
