{pkgs, ...}:{
  extraPackages = [
    pkgs.rust-analyzer
    pkgs.rustfmt
  ];

  plugins = {
    rustaceanvim.enable = true;

    conform-nvim = {
      enable = true;
      formattersByFt = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };
  };

}
