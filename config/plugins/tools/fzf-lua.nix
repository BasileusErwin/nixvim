{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    fzf
    ripgrep
    fd
  ];

  plugins.fzf-lua = {
    enable = true;
    settings = {
      files = {
        color_icons = true;
        file_icons = true;
        multiprocess = true;
      };
      winopts = {
        col = 0.3;
        height = 0.4;
        row = 0.99;
        width = 0.93;
      };
    };

    keymaps = {
      "<leader>b" = {
        action = "buffers";
        options = {
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
