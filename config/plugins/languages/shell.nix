{ pkgs, ... }:
{
  extraPackages = [
    pkgs.bash
    pkgs.git
    pkgs.shellcheck
  ];

  plugins = {
    lsp.servers.bashls.enable = true;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft.bash = [ "shellcheck" ];
    };
  };
}
