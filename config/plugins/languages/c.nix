{ pkgs, helpers, ... }:
{

  extraPackages = with pkgs; [
    clang
    clang-tools
    cmake
    cmake-format
    checkmake
    nasm
    gcc
    gdb
  ];

  keymaps = [
    {
      key = "<leader>Cb";
      action = "<cmd>CMakeBuild<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Build";
        silent = true;
      };
    }
    {
      key = "<leader>Cc";
      action = "<cmd>CMakeClean<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Clean";
        silent = true;
      };
    }
    {
      key = "<leader>Cf";
      action = "<cmd>CMakeGenerate<cr>";
      mode = [
        "n"
        "v"
      ];
      options = {
        desc = "Generate";
        silent = true;
      };
    }
  ];

  plugins = {
    lsp.servers.clangd.enable = true;
    cmake-tools = {
      enable = true;
      settings.cmake_build_directory = "build/\${variant:buildtype}";
    };

    conform-nvim = {
      enable = true;

      settings.formatters_by_ft = {
        nasm = [ "asmfmt" ];
        asm = [ "asmfmt" ];
        c = [ "clang-format" ];
        cpp = [ "clang-format" ];
        cmake = [ "cmake-format" ];
        make = [ "cmake-format" ];
      };
    };

    none-ls.sources.diagnostics = {
      checkmake.enable = true;
      cmake_lint.enable = true;
    };

    dap = {
      adapters.executables.gdb = {
        command = "gdb";
        args = [
          "--interpreter=dap"
          "--eval-command"
          "set print pretty on"
        ];
      };

      configurations.c = [
        {
          type = "gdb";
          request = "launch";
          name = "Launch in build directory";
          configuration = {
            program = helpers.mkRaw ''
              function()
                local dir = vim.fn.getcwd()
                return dir .. "/build/" .. vim.fs.basename(dir)
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
          type = "gdb";
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
