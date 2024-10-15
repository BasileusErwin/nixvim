{ pkgs, ... }:
{
  extraPlugins = [
    pkgs.vimPlugins.supermaven-nvim
  ];

  extraConfigLua = ''
    require("supermaven-nvim").setup({ })
  '';

  plugins = {
    lazy.enable = true;
    dressing = {
      enable = true;
    };

    copilot-lua = {
      enable = false;
      panel.enabled = false;
      suggestion.enabled = false;
      filetypes = {
        "." = true;
        yaml = true;
        markdown = true;
        help = false;
        gitcommit = true;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
      };
    };
  };
}
