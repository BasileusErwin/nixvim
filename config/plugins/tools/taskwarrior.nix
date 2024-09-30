{ pkgs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "m_taskwarrior_d.nvim";
      src = pkgs.fetchFromGitHub {
        owner = "huantrinh1802";
        repo = "m_taskwarrior_d.nvim";
        rev = "main";
        sha256 = "sha256-l8UkarXVPzf3wJZUTdXBivl7HGyzXqRyfm+oMDPQUyQ=";
      };
    })
  ];

  extraConfigLua = ''
    require("m_taskwarrior_d").setup({
      file_pattern = { "*-task.md" },
    })
  '';
}
