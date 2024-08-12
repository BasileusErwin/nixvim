{
  plugins = {
    cmp-buffer.enable = true;
    cmp-path.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp_luasnip.enable = true;
    cmp-cmdline.enable = true;
    cmp-git.enable = true;
    copilot-cmp.enable = true;

    cmp = {
      enable = true;
      settings = {

        sources = [
          {
            name = "nvim_lsp";
          }
          {
            name = "copilot";
          }
          {
            name = "luasnip";
          }
          {
            name = "path";
          }
          {
            name = "buffer";
          }
          {
            name = "git";
          }
          {
            name = "cmdline";
          }
          {
            name = "nvim_lua";
          }
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
          "<Tab>" = ''
            cmp.mapping(function(fallback)
                if cmp.visible() then
                  cmp.select_next_item()
                else
                  fallback()
                end
              end, {
                "i",
                "s",
            })
          '';
          "<S-Tab>" = ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end, {
              "i",
              "s",
            })
          '';
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
          cmdline = {
            "/" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [
                { name = [ "buffer" ]; }
              ];
            };
            "?" = {
              mapping = {
                __raw = "cmp.mapping.preset.cmdline()";
              };
              sources = [
                { name = [ "buffer" ]; }
              ];
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
