{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "avante";
      src = inputs.plugin-avante;
    })
  ];

  extraConfigLua = ''
    require('avante').setup({
      provider = "copilot",
    })
  '';

  plugins = {
    lazy.enable = true;
    dressing = {
      enable = true;
    };

    copilot-lua = {
      enable = true;
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
