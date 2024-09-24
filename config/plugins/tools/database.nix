{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    vim-dotenv
    vim-dadbod-completion
    vim-dadbod
    vim-dadbod-ui
  ];

  extraPackages = with pkgs; [
    sqlite
    mariadb
    postgresql
    mysql
    redis
  ];

  globals = {
    db_ui_use_nerd_fonts = 1;
    db_ui_show_database_icon = 1;
    db_ui_force_echo_notifications = 1;
    db_ui_win_position = "left";
    db_ui_winwidth = 120;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>b";
      action = "<cmd>DBUIToggle<cr>";
      options = {
        silent = true;
      };
    }
  ];
}
