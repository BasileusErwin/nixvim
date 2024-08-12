{
  plugins.bufferline = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<Tab>";
      action = ":BufferLineCycleNext<CR>";
    }
    {
      mode = "n";
      key = "<S-Tab>";
      action = ":BufferLineCyclePrev<CR>";
    }
  ];
}
