{
  plugins.neoscroll = {
    enable = true;
    settings = {
      cursor_scrolls_alone = true;
      easing_function = "quadratic";
      hide_cursor = true;
      mappings = [];
      respect_scrolloff = false;
      stop_eof = true;
    };
  };

  keymaps = [
    {
      mode = ["n" "v"];
      key = "<M-k>";
      action = "<cmd>lua require('neoscroll').scroll(-vim.wo.scroll, true, 10)<CR>";
    }
    {
      mode = ["n" "v"];
      key = "<M-j>";
      action = "<cmd>lua require('neoscroll').scroll(vim.wo.scroll, true, 10)<CR>";
    }
    {
      mode = ["n" "v"];
      key = "zz";
      action = "<cmd>lua require('neoscroll').zz({ half_win_duration = 0 })<CR>";
    }
    {
      mode = ["n" "v"];
      key = "zt";
      action = "<cmd>lua require('neoscroll').zt({ half_win_duration = 0 })<CR>";
    }
    {
      mode = ["n" "v"];
      key = "zb";
      action = "<cmd>lua require('neoscroll').zb({ half_win_duration = 0 })<CR>";
    }
  ];
}
