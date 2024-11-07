{ pkgs, helpers, ... }:
let
  kinds = {
    Supermaven = " ";
    Copilot = " ";
    Array = "󰕤 ";
    Boolean = " ";
    Class = " ";
    Color = " ";
    Constant = " ";
    Constructor = " ";
    Enum = " ";
    EnumMember = " ";
    Event = "󱐋";
    Field = " ";
    File = " ";
    Folder = " ";
    Function = "󰘧";
    Interface = " ";
    Key = " ";
    Keyword = " ";
    Method = " ";
    Module = " ";
    Namespace = " ";
    Null = "󰟢";
    Number = " ";
    Object = " ";
    Operator = " ";
    Package = " ";
    Property = "󱕴";
    Reference = " ";
    Snippet = " ";
    String = "󰅳 ";
    Struct = " ";
    Text = "󰦪";
    TypeParameter = "󰡱 ";
    Unit = " ";
    Value = " ";
    Variable = "󰫧 ";
    Macro = "󱃖 ";
  };
in
{
  extraPlugins = with pkgs.vimPlugins; [
    lspkind-nvim
  ];

  extraConfigLua = ''
    require('lspkind').init({
      mode = "symbol_text",
      maxwidth = 50,
      symbol_map = kinds,
    })
  '';

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
          { name = "luasnip"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "git"; }
        ];

        experimental = {
          ghostText = true;
          nativeMenu = true;
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
          "<CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })";
          "<Tab>" = helpers.mkRaw ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end)
          '';
          "<S-Tab>" = helpers.mkRaw ''
            cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
              else
                fallback()
              end
            end)
          '';
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
        };

        window = {
          completion = {
            winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None";
            col_offset = -3;
            side_padding = 0;
          };
        };

        formatting = {
          fields = [
            "kind"
            "abbr"
            "menu"
          ];
          format = helpers.mkRaw ''
            function(entry, vim_item)
              local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50, symbol_map = kinds })(entry, vim_item);

              local strings = vim.split(kind.kind, "%s", { trimempty = true })

              kind.kind = " " .. (strings[1] or "") .. " "
              kind.menu = "⌈" .. (strings[2] or "") .. "⌋"

              return kind
            end
          '';
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

        filetype = {
          sql = {
            sources = [
              { name = "cmp-dbee"; }
            ];
          };
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
