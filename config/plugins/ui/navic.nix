{
  plugins = {
    navic = {
      enable = true;
    };

    barbecue = {
      enable = true;
      settings ={
        create_autocmd = false;
      };
    };
  };

  extraConfigLua = ''
    local status_barbecue, barbecue = pcall(require, "barbecue")

    if status_barbecue then
      -- triggers CursorHold event faster
      vim.opt.updatetime = 200
      vim.api.nvim_create_autocmd({
        "WinScrolled", -- or WinResized on NVIM-v0.9 and higher
        "BufWinEnter",
        "CursorHold",
        "InsertLeave",

        -- include this if you have set `show_modified` to `true`
        "BufModifiedSet",
      }, {
        group = vim.api.nvim_create_augroup("barbecue.updater", {}),
        callback = function()
          require("barbecue.ui").update()
        end,
      })
    end
  '';
}
