{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimPlugins.nvim-treesitter.overrideAttrs {
      src = pkgs.fetchFromGitHub {
        owner = "BasileusErwin";
        repo = "nvim-treesitter";
        rev = "master";
        hash = "sha1-r//XdM2Wk2SlWnQaBrU13xXGIJQ=";
      };
    })
  ];

  plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = "all";
      auto_install = true;
      highlight = {
        enable = true;
        use_languagetree = true;
      };
      indent.enable = true;
      matchup.enable = true;
      tree_docs.enable = true;
      autotag.enable = true;
      context_commentstring = {
        enable = true;
        config = {
          typescript = "// %s";
          css = "/* %s */";
          scss = "/* %s */";
          html = "<!-- %s -->";
          lua = "-- %s";
          bash = "# %s";
        };
      };
      refactor = {
        highlight_definitions.enable = true;
        highlight_current_scope.enable = false;
      };
      rainbow = {
        enable = true;
        extended_mode = true;
        max_file_lines = 1000;
      };
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "gnn";
          node_incremental = "grn";
          scope_incremental = "grc";
          node_decremental = "grm";
        };
      };
    };
  };

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config["ignis"] = {
      install_info = {
        url = "https://github.com/Ignis-lang/tree-sitter-ignis.git",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = { "Ignis", "ignis", "ign" },
    }

    parser_config["ion"] = {
      install_info = {
        url = "https://github.com/Ignis-lang/tree-sitter-ion.git",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "ion",
    }
  '';
}
