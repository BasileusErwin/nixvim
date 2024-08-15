{
  plugins.toggleterm = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>t";
      action = "<cmd>ToggleTerm<cr>";
    }
  ];
}
