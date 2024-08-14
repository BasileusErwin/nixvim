{
  plugins.bufferline = {
    enable = true;
    numbers = "none";
    diagnostics = "nvim_lsp";
    showTabIndicators = true;
    showBufferCloseIcons = false;
    showCloseIcon = false;
    colorIcons = true;
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
