{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        theme = "auto";
        globalstatus = true;
        icons_enabled = true;
        always_divide_middle = true;
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
      };
      sections = {
        lualine_a = [
          {
            __unkeyed-1 = "mode";
            icon = " ";
            upper = true;
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          {
            __unkeyed-1 = "diff";
            colored = true;
            always_visible = true;
            symbols = {
              added = " ";
              modified = " ";
              removed = " ";
            };
          }
        ];
        lualine_c = [ { } ];
        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_diagnostic" ];
            sections = [
              "error"
              "warn"
            ];
            symbols = {
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
            };
            colored = true;
            update_in_insert = true;
            always_visible = true;
          }
        ];
        lualine_y = [
          {
            __unkeyed-1 = "filetype";
            icons_enabled = true;
            always_visible = true;
            symbols = {
              unix = "LF";
              dos = "CRLF";
              mac = "CR";
            };
          }
        ];
        lualine_z = [ { __unkeyed-1 = "location"; } ];
      };
    };
  };
}
