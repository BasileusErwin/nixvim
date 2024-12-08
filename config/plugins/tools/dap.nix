let
  enable = false;
in
{

  plugins = {
    cmp-dap = {
      inherit enable;
    };

    dap = {
      inherit enable;
      signs = {
        dapStopped = {
          text = "👉";
          texthl = "DiagnosticWarn";
        };
        dapBreakpoint = {
          text = "🛑";
          texthl = "DiagnosticInfo";
        };
        dapBreakpointRejected = {
          text = "🚫";
          texthl = "DiagnosticError";
        };
        dapBreakpointCondition = {
          text = "🔍";
          texthl = "DiagnosticInfo";
        };
        dapLogPoint = {
          text = "📝";
          texthl = "DiagnosticInfo";
        };
      };
      extensions = {
        dap-ui = { inherit enable; };
        dap-virtual-text = { inherit enable; };
      };
    };
  };

  keymaps =
    if enable then
      [
        {
          key = "<leader>Db";
          action = "<cmd>lua require('dap').toggle_breakpoint()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Toggle Breakpoint";
            silent = true;
          };
        }
        {
          key = "<leader>Dc";
          action = "<cmd>lua require('dap').continue()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Continue";
            silent = true;
          };
        }
        {
          key = "<leader>Di";
          action = "<cmd>lua require('dap').step_into()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Step Into";
            silent = true;
          };
        }
        {
          key = "<leader>Do";
          action = "<cmd>lua require('dap').step_out()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Step Out";
            silent = true;
          };
        }
        {
          key = "<leader>Dr";
          action = "<cmd>lua require('dap').run_to_cursor()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Run to cursor";
            silent = true;
          };
        }
        {
          key = "<leader>Ds";
          action = "<cmd>lua require('dap').step_over()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Step Over";
            silent = true;
          };
        }
        {
          key = "<leader>Du";
          action = "<cmd>lua require('dapui').toggle()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Toggle UI";
            silent = true;
          };
        }
        {
          key = "<leader>Dx";
          action = "<cmd>lua require('dap').terminate()<CR>";
          mode = [
            "n"
          ];
          options = {
            desc = "Disconnect";
            silent = true;
          };
        }
      ]
    else
      [ ];
}
