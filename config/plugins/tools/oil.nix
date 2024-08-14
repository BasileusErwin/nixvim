{
  plugins.oil = {
    enable = true;
    settings = {
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
      };
      float = {
        padding = 10;
        max_width = 100;
        max_height = 100;
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil --float<CR>";
    }
  ];
}
