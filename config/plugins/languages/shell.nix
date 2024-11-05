{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    bash
    git
    shellcheck
    shfmt
  ];

  plugins = {
    lsp.servers.bashls.enable = true;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        bash = [ "shfmt" ];
        sh = [ "shfmt" ];
        shell = [ "shfmt" ];
      };
    };
  };
}
