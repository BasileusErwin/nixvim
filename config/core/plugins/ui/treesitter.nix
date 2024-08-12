{
  ...
}:
{
  plugins.treesitter = {
    enable = true;
    settings = {
      auto_install = true;
      highlight = {
        enable = true;
        use_languagetree = true;
      };
      indent = {
        enable = true;
      };
      matchup = {
        enable = true;
      };
      tree_docs = {
        enable = true;
        spec_config = {
          jsdoc = {
            slots = {
              class = {
                author = true;
              };
            };
          };
        };
      };
      autotag = {
        enable = true;
      };
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
        highlight_definitions = {
          enable = true;
        };
        highlight_current_scope = {
          enable = false;
        };
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
}
