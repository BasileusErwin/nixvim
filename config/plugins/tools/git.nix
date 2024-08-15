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

    neogit = {
      enable = true;
      settings.integrations.diffview = true;
    };
    diffview.enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>g";
      options = {
        desc = "Open Neogit";
        silent = true;
        nowait = true;
      };
      action = "<cmd>Neogit<cr>";
    }
  ];
}
