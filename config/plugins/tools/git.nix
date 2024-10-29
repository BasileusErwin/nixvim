{ pkgs, ... }:
{
  extraPackages = [
    pkgs.git
  ];

  plugins = {
    gitsigns = {
      enable = true;
      settings = {
        current_line_blame = true;
        signs = {
          add = {
            text = " ";
          };
          change = {
            text = " ";
          };
          delete = {
            text = " ";
          };
          untracked = {
            text = "";
          };
          topdelete = {
            text = "󱂥 ";
          };
          changedelete = {
            text = "󱂧 ";
          };
        };
      };
    };

    neogit = {
      enable = true;
      settings.integrations.diffview = true;
    };
    diffview.enable = true;

    octo = {
      enable = true;
      settings = {
        picker = "fzf-lua";
        ssh_aliases = {
          "github-work" = "github.com";
        };
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>go";
      options = {
        desc = "Open Octo promp";
        silent = true;
        nowait = true;
      };
      action = ":Octo ";
    }
    {
      mode = "n";
      key = "<leader>gop";
      options = {
        desc = "Open Octo PR promp";
        silent = true;
        nowait = true;
      };
      action = ":Octo pr ";
    }
    {
      mode = "n";
      key = "<leader>gor";
      options = {
        desc = "Open Octo review promp";
        silent = true;
        nowait = true;
      };
      action = ":Octo review ";
    }
    {
      mode = "n";
      key = "<leader>goc";
      options = {
        desc = "Open Octo comment promp";
        silent = true;
        nowait = true;
      };
      action = ":Octo comment ";
    }
    {
      mode = "n";
      key = "<leader>gg";
      options = {
        desc = "Open Neogit";
        silent = true;
        nowait = true;
      };
      action = "<cmd>Neogit<cr>";
    }
  ];
}
