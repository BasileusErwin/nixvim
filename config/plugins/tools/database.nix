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
    redis
  ];

  globals = {
    db_ui_use_nerd_fonts = 1;
    db_ui_show_database_icon = 1;
    db_ui_force_echo_notifications = 1;
    db_ui_win_position = "right";
    db_ui_winwidth = 80;
    db_ui_execute_on_save = 0;
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
