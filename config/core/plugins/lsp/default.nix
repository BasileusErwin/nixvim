{
  imports = [
    ./cmp.nix
  ];

  plugins = {
    nix.enable = true;

    lsp = {
      enable = true;
      keymaps.lspBuf = {
        K = "hover";
        gD = "references";
        gd = "definition";
        gi = "implementation";
        gT = "type_definition";
        "<leader>vrn" = "rename";
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
        Unit = "塞";
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
  };
}
