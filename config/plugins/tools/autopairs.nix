{
  plugins.nvim-autopairs = {
    enable = true;
    settings = {
      checkTs = true;
      tsConfig = {
        lua = [
          "string"
          "source"
        ];
        javascript = [
          "string"
          "template_string"
        ];
        java = false;
      };
      disable_filetype = [
        "TelescopePrompt"
        "spectre_panel"
      ];
      fast_wrap = {
        map = "<M-e>";
        chars = [
          "{"
          "["
          "("
          "\""
          "'"
        ];
        offset = 0;
        endKey = "$";
        keys = "qwertyuiopzxcvbnmasdfghjkl";
        check_comma = true;
        highlight = "PmenuSel";
        highlightGrey = "LineNr";
      };
    };
  };
}
