{
  plugins.indent-blankline = {
    enable = true;
    settings = {
      indent = {
        char = "|";
      };
      scope = {
        enabled = true;
        show_start = true;
        show_end = true;
        injected_languages = false;
        highlight = [
          "Function"
          "Label"
        ];
        priority = 500;
      };
    };
  };
}
