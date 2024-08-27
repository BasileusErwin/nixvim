{
  pkgs,
  inputs,
  helpers,
  ...
}:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "kulala";
      src = inputs.plugin-kulala;
    })
  ];

  extraConfigLua = ''
    require('kulala').setup()
  '';

  filetype.extension.http = "http";

  files."after/ftplugin/http.lua".keymaps = [
    {
      mode = "n";
      key = "<leader>rn";
      action = "<cmd>lua require('kulala').run()<cr>";
      options = {
        desc = "Run request";
      };
    }
    {
      mode = "n";
      key = "<leader>ra";
      action = "<cmd>lua require('kulala').run_all()<cr>";
      options = {
        desc = "Run all requests";
      };
    }
    {
      mode = "n";
      key = "<leader>rr";
      action = "<cmd>lua require('kulala').replay()<cr>";
      options = {
        desc = "Replay request";
      };
    }
    {
      mode = "n";
      key = "<leader>rq";
      action = "<cmd>lua require('kulala').replay_last()<cr>";
      options = {
        desc = "Replay last requests";
      };
    }
    {
      mode = "n";
      key = "<leader>rs";
      action = "<cmd>lua require('kulala').scratchpad()<cr>";
      options = {
        desc = "Open scratchpad";
      };
    }
    {
      mode = "n";
      key = "<leader>rj";
      action = "<cmd>lua require('kulala').jump_next()<cr>";
      options = {
        desc = "Jump to next request";
      };
    }
    {
      mode = "n";
      key = "<leader>rk";
      action = "<cmd>lua require('kulala').jump_prev()<cr>";
      options = {
        desc = "Jump to previous request";
      };
    }
    {
      mode = "n";
      key = "<leader>rv";
      action = "<cmd>lua require('kulala').toggle_view()<cr>";
      options = {
        desc = "Toggle view";
      };
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>rp";
      action = helpers.mkRaw "function() require('kulala').search() end";
      options = {
        desc = "Search request";
      };
    }
  ];
}
