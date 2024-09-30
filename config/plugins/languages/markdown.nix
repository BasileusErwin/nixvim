{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "render-markdown";
      src = inputs.plugin-render-markdown;
    })
  ];

  extraPackages = [
    pkgs.python312Packages.pylatexenc
  ];

  extraConfigLua = ''
    require("render-markdown").setup({
      file_types = { "markdown" },
      latex = {
        enabled = false,
      },
      checkbox = {
        enabled = true,
        custom = {
          started = {
            raw = "[>]",
            rendered = "",
            highlight = "RenderMarkdownTableHead",
          },
          deleted = {
            raw = "[~]",
            rendered = "",
            highlight = "RenderMarkdownError",
          },
        },
      },
    })
  '';

  plugins = {
    lsp.servers.ltex = {
      enable = true;

      settings = {
        enabled = [
          "latex"
          "tex"
          "bib"
          "markdown"
          "gitcommit"
          "text"
          "org"
          "norg"
        ];
        language = "auto";
        dictionary = {
          "es" = [ ":/home/iperez/.config/nvim/dict/es" ];
        };
      };
    };
    none-ls.sources.diagnostics.markdownlint.enable = true;
  };
}
