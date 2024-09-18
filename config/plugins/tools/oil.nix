{
  helpers,
  ...
}:
{
  plugins.oil = {
    enable = true;
    settings = {
      experimental_watch_for_changes = true;
      delete_to_trash = true;
      view_options = {
        show_hidden = true;
      };
      float = {
        padding = 10;
        max_width = 100;
        max_height = 100;
      };
      keymaps = {
        "g?" = "actions.show_help";
        "gs" = helpers.mkRaw "function() require('oil').set_columns({ 'icon', 'permissions', 'size' }) end";
        "gS" = helpers.mkRaw "function() require('oil').set_columns({ 'icon' }) end";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Oil --float<CR>";
      options = {
        desc = "Open file explorer";
      };
    }
  ];
}
