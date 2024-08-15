{
  plugins.toggleterm = {
    enable = true;

    settings = {
      winbar.enabled = true;
      size = 20;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>ToggleTerm<cr>";
    }
    {
      mode = "t";
      key = "<C-q>";
      action = "<cmd>ToggleTerm<cr>";
    }
  ];
}
