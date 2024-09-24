{
  plugins = {
    cmp-buffer.enable = true;
    cmp-async-path.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = true;
    cmp-git.enable = true;
    cmp-nvim-lsp-signature-help.enable = true;
    cmp-treesitter.enable = true;
    cmp-dap.enable = true;
    copilot-cmp.enable = false;

    cmp = {
      enable = true;
      settings = {
        sources = [
          { name = "nvim_lsp"; }
          { name = "supermaven"; }
          # { name = "copilot"; }
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "git"; }
        ];

        experimental = {
          ghostText = true;
          nativeMenu = false;
        };

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-e>" = "cmp.mapping.close()";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<CR>" = "cmp.mapping.confirm({ select = true })";
          "<Tab>" = "cmp.mapping.select_next_item()";
          "<S-Tab>" = "cmp.mapping.select_prev_item()";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
        };

        formatting = {
          fields = [
            "abbr"
            "kind"
            "menu"
          ];
        };

        native = {
          border = [
            "╭"
            "─"
            "╮"
            "│"
            "╯"
            "─"
            "╰"
            "│"
          ];
        };

        window = {
          completion.border = "rounded";
          documentation.border = "rounded";
        };

        filetype = {
          gitcommit = {
            sources = [
              { name = "cmp_git"; }
              { name = "buffer"; }
            ];
          };
          "*" = {
            sources = [
              { name = "nvim_lsp"; }
              #{ name = "copilot"; }
              { name = "supermaven"; }
              { name = "nvim_lua"; }
              { name = "buffer"; }
            ];
          };
          cmdline = {
            "/" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [ { name = [ "buffer" ]; } ];
            };
            "?" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [ { name = [ "buffer" ]; } ];
            };
            ":" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [
                { name = [ "buffer" ]; }
                { name = [ "path" ]; }
                { name = [ "cmdline" ]; }
              ];
              matching = {
                disallowSymbolNonprefixMatching = false;
              };
            };
          };

        };

      };

    };
  };
}
