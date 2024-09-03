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
      formattersByFt = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };
  };
}
