{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "hover";
      src = inputs.plugin-hover;
    })
  ];

  extraConfigLua = ''
    local status_hover, hover = pcall(require, 'hover')

    if status_hover then
      hover.setup({
        init = function()
          require("hover.providers.lsp")
          require("hover.providers.gh")
          require("hover.providers.gh_user")
          require("hover.providers.jira")
          require("hover.providers.man")
          require("hover.providers.dictionary")
        end,
        preview_opts = {
          border = "single",
        },
        preview_window = true,
        title = true,
      })
    end
  '';

  keymaps = [
    {
      mode = "n";
      key = "K";
      action = "<cmd>lua require('hover').hover()<CR>";
    }
    {
      mode = "n";
      key = "gK";
      action = "<cmd>lua require('hover').hover_select()<CR>";
    }
    {
      mode = "n";
      key = "<C-p>";
      action = "<cmd>lua require('hover').hover_switch('previous')<CR>";
    }
    {
      mode = "n";
      key = "<C-n>";
      action = "<cmd>lua require('hover').hover_switch('next')<CR>";
    }
  ];
}
