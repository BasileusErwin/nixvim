{
  pkgs,
  ...
}:
{
  extraPlugins = with pkgs; [
    (vimUtils.buildVimPlugin {
      inherit (luaPackages.lua-utils-nvim) pname version src;
    })
    (vimUtils.buildVimPlugin {
      inherit (luaPackages.pathlib-nvim) pname version src;
    })
    (vimUtils.buildVimPlugin {
      inherit (luaPackages.nvim-nio) pname version src;
    })
  ];

  # extraPackages = [
  #   (pkgs.rustPlatform.buildRustPackage rec {
  #     pname = "norg-fmt";
  #     version = "main";
  #
  #     src = pkgs.fetchFromGitHub {
  #       owner = "nvim-neorg";
  #       repo = pname;
  #       rev = version;
  #       hash = "sha256-GS8Ub1TMKvCyABXZLxasM9Uo/6ccpTyfrE0ZoiH5QKg=";
  #     };
  #
  #     cargoHash = "sha256-L9eVK8HL7XuHzhgEPlAKK/KXtG6LAmqcu6y8I1yFG/o=";
  #   })
  # ];

  plugins = {
    neorg = {
      enable = false;
      modules = {
        "core.defaults".__empty = null;
        "core.completion" = {
          config = {
            engine = "nvim-cmp";
          };
        };
        "core.dirman" = {
          config = {
            workspaces = {
              personal = "~/.notes/personal";
              work = "~/.notes/work";
            };
          };
        };
      };
    };
    conform-nvim = {
      enable = true;

      settings.formatters_by_ft.norg = [ "norg-fmt" ];
    };
  };
}
