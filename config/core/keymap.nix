{
  keymaps = [
    {
      mode = "n";
      key = "<C-q>";
      action = "<CMD>q<CR>";
    }
    {
      mode = "v";
      key = "<";
      action = "<cmd><gv<cr>";
    }
    {
      mode = "v";
      key = ">";
      action = "<cmd>>gv<cr>";
    }
    {
      mode = "v";
      key = "p";
      action = "\"_dP";
    }
    {
      mode = "n";
      key = "<ESC>";
      action = "<cmd>nohlsearch<Bar><CR><cmd>echo<CR>";
    }
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w>h";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w>j";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w>k";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w>l";
    }
    {
      mode = "n";
      key = "<M-j>";
      action = "10<C-e>";
    }
    {
      mode = "n";
      key = "<M-k>";
      action = "10<C-y>";
    }
    {
      mode = "n";
      key = "<C-s>";
      action = "<cmd>w<CR>";
    }
    {
      mode = "n";
      key = "<C-S>";
      action = "<cmd>wa<CR>";
    }
    {
      mode = "n";
      key = "<M-q>";
      action = "<cmd>bd<CR>";
    }
    {
      mode = "n";
      key = "<C-M-k>";
      action = "<cmd>resize -2<CR>";
    }
    {
      mode = "n";
      key = "<C-M-j>";
      action = "<cmd>resize +2<CR>";
    }
    {
      mode = "n";
      key = "<C-M-h>";
      action = "<cmd>vertical resize -2<CR>";
    }
    {
      mode = "n";
      key = "<C-M-l>";
      action = "<cmd>vertical resize +2<CR>";
    }
  ];
}
