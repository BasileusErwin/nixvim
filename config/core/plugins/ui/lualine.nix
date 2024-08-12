{
  plugins.lualine = {
    enable = true;
    theme = "auto";
    globalstatus = true;
    iconsEnabled = true;
    extensions = [ "quickfix" ];
    componentSeparators = {
      left = "";
      right = "";
    };
    sectionSeparators = {
      left = "";
      right = "";
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
        "diff"
        "diagnostics"
      ];
      lualine_c = [ ];
      lualine_x = [ ];
      lualine_y = [
        {
          name = "filename";
          extraConfig = {
            file_status = true;
            path = 1;
          };
        }
        "filetype"
      ];
      lualine_z = [ "location" ];
    };
    inactiveSections = {
      lualine_a = [ ];
      lualine_b = [ ];
      lualine_c = [ "filename" ];
      lualine_x = [ "location" ];
      lualine_y = [
        "filename"
        "encoding"
        "filetype"
      ];
      lualine_z = [ ];
    };
  };
}
