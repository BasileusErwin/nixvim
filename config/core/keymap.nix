{
  keymaps = [
    {
      mode = ["n" "v"];
      key = "<C-q>";
      action = "<CMD>q<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = "<";
      action = "<gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = ">";
      action = ">gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "v";
      key = "p";
      action = "\"_dP";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<ESC>";
      action = "<cmd>nohlsearch<Bar><CR><cmd>echo<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-s>";
      action = "<cmd>w<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-S>";
      action = "<cmd>wa<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<M-q>";
      action = "<cmd>bd<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-M-k>";
      action = "<cmd>resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-M-j>";
      action = "<cmd>resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-M-h>";
      action = "<cmd>vertical resize -2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "<C-M-l>";
      action = "<cmd>vertical resize +2<CR>";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "K";
      action = ":move '<-2<CR>gv-gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
    {
      mode = ["n" "v"];
      key = "J";
      action = ":move '>+1<CR>gv-gv";
      options = {
        noremap = true;
        silent = true;
      };
    }
  ];
}
