{ pkgs, ... }:
{
  extraPackages = [
    pkgs.fzf
    pkgs.ripgrep
    pkgs.fd
  ];
  plugins.fzf-lua = {
    enable = true;
    keymaps = {
      "<leader>fGs" = {
        action = "git_status";
        options = {
          desc = "Git status";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>fb" = {
        action = "buffers";
        options = {
          desc = "Find in buffer";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>ff" = {
        action = "files";
        options = {
          desc = "Find files";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>fg" = {
        action = "grep";
        options = {
          desc = "Live Grep";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>flD" = {
        action = "lsp_declarations";
        options = {
          desc = "Declarations";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>fld" = {
        action = "lsp_definitions";
        options = {
          desc = "Definitions";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>fli" = {
        action = "lsp_implementations";
        options = {
          desc = "lsp_implementations";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>flr" = {
        action = "lsp_references";
        options = {
          desc = "References";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
      "<leader>flt" = {
        action = "lsp_type_definitions";
        options = {
          desc = "Type Definitions";
          nowait = false;
          remap = false;
          silent = true;
        };
      };
    };
  };
}
