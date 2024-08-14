{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "surround.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "ur4ltz";
        repo = "surround.nvim";
        rev = "master";
        hash = "sha1-myGU4khrq6h1E8JEr8fEb/zlmpI=";
      };
    })
  ];

  extraConfigLua = ''
    require("surround").setup({
      context_offset = 100,
      load_autogroups = false,
      mappings_style = "sandwich",
      map_insert_mode = true,
      quotes = { "'", '"', '`' },
      brackets = { "(", "{", "[" },
      space_on_closing_char = false,
      pairs = {
        nestable = { b = { "(", ")" }, s = { "[", "]" }, B = { "{", "}" }, a = { "<", ">" } },
        linear = { q = { "'", "'" }, t = { "`", "`" }, d = { '"', '"' } },
        prefix = "s",
      },
    })
  '';

}
