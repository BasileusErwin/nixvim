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
  ];
}
