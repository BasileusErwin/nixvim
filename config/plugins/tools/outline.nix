{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    outline-nvim
  ];
  extraConfigLua = ''
    require('outline').setup({
      position = "left",
      symbols = {
        icon_source = 'lspkind'
      },
    })
  '';
  keymaps = [
    {
      mode = "n";
      key = "<leader>o";
      action = "<cmd>lua require('outline').toggle()<cr>";
    }
  ];
}
