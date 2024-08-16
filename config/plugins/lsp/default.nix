{
  imports = [ ./cmp.nix ];

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
            action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
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
            key = "<leader>ci";
            action = "LspInfo";
            mode = [ "n" ];
            options = {
              desc = "Lsp info";
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
      symbolMap = {
        Text = "";
        Method = "";
        Function = "";
        Constructor = "";
        Field = "ﰠ";
        Variable = "";
        Class = "ﴯ";
        Interface = "";
        Module = "";
        Property = "ﰠ";
        Unit = "";
        Value = "";
        Enum = "";
        Keyword = "";
        Snippet = "﬌";
        Color = "";
        File = "";
        Reference = "";
        Folder = "";
        EnumMember = "";
        Constant = "";
        Struct = "פּ";
        Event = "";
        Operator = "";
        TypeParameter = "";
      };
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
