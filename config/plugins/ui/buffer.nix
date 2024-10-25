{
  plugins.bufferline = {
    enable = true;
    settings.options = {
      numbers = "none";
      diagnostics = "nvim_lsp";
      show_tab_indicators = true;
      show_buffer_close_icons = false;
      show_close_icon = false;
      color_icons = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = "<cmd>BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = "<cmd>BufferLineCyclePrev<CR>";
    }
  ];
}
