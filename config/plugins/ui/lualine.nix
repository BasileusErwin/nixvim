{
  plugins.lualine = {
    enable = true;
    theme = "auto";
    globalstatus = true;
    iconsEnabled = true;
    alwaysDivideMiddle = true;
    extensions = [ ];
    tabline = { };
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
    };
    sections = {
      lualine_a = [
        {
          name = "mode";
          extraConfig = {
            upper = true;
          };
        }
      ];
      lualine_b = [
        {
          name = "branch";
          icon = "";
        }
        {
          name = "diff";
          extraConfig = {
            colored = true;
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          };
        }
        {
          name = "diagnostics";
          extraConfig = {
            sources = [ "nvim_diagnostic" ];
            sections = [
              "error"
              "warn"
            ];
            symbols = {
              error = " ";
              warn = " ";
            };
            colored = true;
            update_in_insert = false;
            always_visible = true;
          };
        }
      ];
      lualine_c = [ { } ];
      lualine_x = [ { } ];
      lualine_y = [
        {
          name = "filetype";
          extraConfig = {
            icons_enabled = true;
            symbols = {
              unix = "LF";
              dos = "CRLF";
              mac = "CR";
            };
          };
        }
      ];
      lualine_z = [ { name = "location"; } ];
    };
  };
}
