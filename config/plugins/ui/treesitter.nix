{ pkgs, inputs, ... }:
let
  treesitter-ignis-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ignis";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "Ignis-lang";
      repo = "tree-sitter-ignis";
      rev = "main";
      sha256 = "xOKFi2pW6T/QCTLNLcAg5auQ2aBnokgU/8DcnE5gwrU=";
    };
  };
  treesitter-ion-grammar = pkgs.tree-sitter.buildGrammar {
    language = "ion";
    version = "0.1.0";
    src = pkgs.fetchFromGitHub {
      owner = "Ignis-lang";
      repo = "tree-sitter-ion";
      rev = "main";
      sha256 = "A8ZaZamxtq9m0uuEGsygldzDJo67SvJI+w2JQupNIxg=";
    };
  };
in
{
  extraPlugins = [
    (pkgs.vimPlugins.nvim-treesitter.overrideAttrs { src = inputs.plugin-treesitter; })
  ];

  plugins.treesitter = {
    enable = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.passthru.allGrammars ++ [
      treesitter-ignis-grammar
      treesitter-ion-grammar
    ];
    settings = {
      ensure_installed = "all";
      auto_install = true;
      highlight = {
        additional_vim_regex_highlighting = true;
        enable = true;
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
          ignis = "// %s";
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
    };
  };

  extraConfigLua = ''
    do
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

    parser_config["ignis"] = {
      install_info = {
        url = "${treesitter-ignis-grammar}",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = { "Ignis", "ignis", "ign" },
    }

    parser_config["ion"] = {
      install_info = {
        url = "${treesitter-ion-grammar}",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "ion",
    }
    end
  '';
}
