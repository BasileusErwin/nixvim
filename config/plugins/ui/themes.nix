{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "tokyodark";
      src = inputs.plugin-tokyodark;
    })
  ];

  extraConfigLua = ''
    require("tokyodark").setup({
      transparent_background = true,
      gamma = 1.00,
      styles = {
        comments = { italic = true },
        keywords = { italic = true, bold = true },
        identifiers = { italic = true },
        functions = { bold = true, italic = true },
        variables = { bold = true },
      },
    })
  '';

  plugins.transparent.enable = true;

  colorschemes = {
    kanagawa = {
      enable = true;
      settings = {
        compile = true;
        undercurl = true;
        commentStyle = {
          italic = true;
        };
        functionStyle = {
          italic = true;
          bold = true;
        };
        keywordStyle = {
          italic = true;
        };
        statementStyle = {
          bold = true;
        };
        typeStyle = {
          italic = true;
          bold = true;
        };
        transparent = true;
        theme = "lotus";
      };
    };

    ayu = {
      enable = false;
      settings = {
        mirage = true;
      };
    };

    tokyonight = {
      enable = false;
    };

    gruvbox = {
      enable = false;
      settings = {
        terminalColors = true;
        undercurl = true;
        underline = true;
        bold = true;
        italic = {
          strings = true;
          emphasis = true;
          comments = true;
          operators = false;
          folds = true;
        };
        strikethrough = true;
        invertSelection = false;
        invertSigns = false;
        invertTabline = false;
        invertIntend_guides = false;
        inverse = true;
      };
    };

  };
}
