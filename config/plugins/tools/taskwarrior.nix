{ pkgs, inputs, ... }:
{
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      name = "m_taskwarrior_d.nvim";
      src = inputs.plugin-taskwarrior;
    })
  ];

  extraConfigLua = ''
    require("m_taskwarrior_d").setup({
      file_pattern = { "*-task.md" },
      task_statuses = { " ", ">", "@", "x", "~" },
      status_map = {
        [" "] = "pending",
        [">"] = "active",
        ["x"] = "completed",
        ["~"] = "deleted",
        ["@"] = "waiting",
      },
    })
  '';
}
