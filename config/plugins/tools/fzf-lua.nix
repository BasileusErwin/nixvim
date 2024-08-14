{ pkgs, ... }:
{
  extraPackages = [
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
  ];
  plugins.fzf-lua = {
    enable = true;
    keymaps = {
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Find in buffer";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>ff" = {
        action = "files";
        options = {
          desc = "Find files";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>fg" = {
        action = "grep";
        options = {
          desc = "Live Grep";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
    };
  };
}
