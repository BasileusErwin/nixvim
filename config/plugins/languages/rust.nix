{ pkgs, helpers, ... }:
{
  extraPackages = with pkgs; [
    rust-analyzer
    rustfmt
    lldb
  ];

  plugins = {
    rustaceanvim.enable = true;

    conform-nvim = {
      enable = true;
      settings.formatters_by_ft = {
        rust = [ "rustfmt" ];
        toml = [ "rustfmt" ];
      };
    };

    dap = {
      enable = true;
      adapters.executables.lldb = {
        command = "lldb";
      };
      configurations.rust = [
        {
          type = "lldb";
          name = "Launch target";
          request = "launch";
          configuration = {
            program = helpers.mkRaw ''
              function()
                local dir = vim.fn.getcwd()
                return dir .. "/target/debug/" .. vim.fs.basename(dir)
              end
            '';
            stopOnEntry = false;
            args = helpers.mkRaw ''
              function()
                local resp = vim.fn.input("Arguments: ")
                if resp == "" then
                  return {}
                end

                return vim.fn.split(resp, " ")
              end
            '';
          };
        }
        {
          name = "Launch custom file";
          type = "lldb";
          request = "launch";
          configuration = {
            program = helpers.mkRaw ''
              function()
                local resp = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                if resp  == "" then
                  return {}
                end

                return resp  
              end
            '';
            stopOnEntry = false;
            args = helpers.mkRaw ''
                function()
                  local resp = vim.fn.input("Arguments: ")
                if resp == "" then
                  return {}
                end

                return vim.fn.split(resp, " ")
              end
            '';
          };
        }
      ];
    };
  };
}
