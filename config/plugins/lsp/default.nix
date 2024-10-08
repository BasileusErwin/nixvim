{ pkgs, ... }:
{
  imports = [ ./cmp.nix ];

  extraPlugins = [
    pkgs.vimPlugins.lsp_signature-nvim
  ];

  extraConfigLua = ''
    require('lsp_signature').setup({
      bind = true;
      max_height = 10;
      max_width = 70;
      noice = true;
      wrap = true;
      floating_window = true;
    })

    vim.api.nvim_set_hl(0, "CmpItemKindSupermaven", {fg ="#6CC644"})
  '';

  plugins = {
    nix.enable = true;
    fidget.enable = true;
    luasnip.enable = true;

    lsp = {
      enable = true;
      keymaps = {
        extra = [
          {
            key = "<leader>ca";
            action = "<cmd>FzfLua lsp_code_actions<CR>";
            mode = [
              "n"
              "v"
            ];
            options = {
              desc = "Code actions";
              silent = true;
            };
          }
          {
            key = "<leader>cd";
            action = "<cmd>lua vim.diagnostic.open_float()<CR>";
            mode = [ "n" ];
            options = {
              desc = "Line diagnostics";
            };
          }
          {
            key = "<leader>cr";
            action = "<cmd>lua vim.lsp.buf.rename()<cr>";
            mode = [ "n" ];
            options = {
              desc = "Rename";
            };
          }

          {
            key = "<leader>dD";
            action = "<cmd>lua vim.diagnostic.goto_next()<CR>";
            options = {
              desc = "Next diagnostic";
            };
          }
          {
            key = "<leader>dE";
            action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>";
            options = {
              desc = "Next Error";
            };
          }
          {
            key = "<leader>dW";
            action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>";
            options = {
              desc = "Next Warning";
            };
          }
          {
            key = "<leader>dd";
            action = "<cmd>lua vim.diagnostic.goto_prev()<CR>";
            options = {
              desc = "Previous Diagnostic";
            };
          }
          {
            key = "<leader>de";
            action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>";
            options = {
              desc = "Previous Error";
            };
          }
          {
            key = "<leader>dw";
            action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>";
            options = {
              desc = "Previous Warning";
            };
          }
        ];
        lspBuf = {
          gr = "references";
          gd = "definition";
          gi = "implementation";
          gt = "type_definition";
        };
      };
      inlayHints = true;
    };

    lspkind = {
      enable = true;
      cmp.enable = true;
      preset = "codicons";
      mode = "symbol_text";
      symbolMap = {
        Supermaven = " ";
        Copilot = " ";
        Array = "󰅪 ";
        Boolean = " ";
        Class = " ";
        Color = " ";
        Constant = " ";
        Constructor = " ";
        Enum = " ";
        EnumMember = " ";
        Event = "";
        Field = " ";
        File = " ";
        Folder = " ";
        Function = "󰘧";
        Interface = " ";
        Key = "󰌆 ";
        Keyword = "󰌆 ";
        Method = " ";
        Module = " ";
        Namespace = "󰅩 ";
        Null = " ";
        Number = " ";
        Object = " ";
        Operator = " ";
        Package = " ";
        Property = " ";
        Reference = " ";
        Snippet = " ";
        String = " ";
        Struct = " ";
        Text = "󰦨 ";
        TypeParameter = " ";
        Unit = "";
        Value = "󰎠 ";
        Variable = "󰫧 ";
        Macro = "󰅪 ";
      };
    };

    none-ls = {
      enable = true;
      sources = {
        code_actions = {
          gitsigns.enable = true;
          gitrebase.enable = true;
          refactoring.enable = true;
          gomodifytags.enable = true;
        };
      };
    };
  };
}
