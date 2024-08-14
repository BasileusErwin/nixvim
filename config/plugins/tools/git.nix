{ pkgs, ... }:
{
  extraPackages = [ pkgs.git ];

  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
      };
    };
  };
}
