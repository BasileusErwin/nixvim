{ pkgs, ... }:
{
  extraPackages = [
    pkgs.rust-analyzer
    pkgs.rustfmt
  ];

  plugins = {
    rust-tools.enable = true;
    lsp.servers.rust-analyzer = {
      enable = true;
      installCargo = true;
      installRustc = false;
    };

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };
  };
}
