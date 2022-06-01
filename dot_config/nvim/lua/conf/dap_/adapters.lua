local M = {}
M.cpp = {
  cppdbg = function()
    return {
      id = "cppdbg",
      type = "executable",
      command = vim.fn.getenv("HOME")
        .. "/.config/nvim/adapters/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
    }
  end,
  config = function()
    return {
      {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
      {
        name = "Attach to gdbserver :1234",
        type = "cppdbg",
        request = "launch",
        MIMode = "gdb", -- Adjust to where gdb is installed
        miDebuggerServerAddress = "localhost:1234",
        miDebuggerPath = "/usr/bin/gdb",
        cwd = "${workspaceFolder}",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        setupCommands = {
          {
            text = "-enable-pretty-printing",
            description = "enable pretty printing",
            ignoreFailures = false,
          },
        },
      },
    }
  end,
}

M.go = {
  go = function()
    return {
      type = "executable",
      command = "node",
      args = { os.getenv("HOME") .. "/.config/nvim/adapters/vscode-go/dist/debugAdapter.js" },
    }
  end,
  config = function()
    return {
      {
        type = "go",
        name = "Debug",
        request = "launch",
        showLog = false,
        program = "${file}",
        dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
      },
    }
  end,
}

M.python = {
  python = function ()
    return {
      type = "executable",
      command = "python",
      args = { "-m", "debugpy.adapter" }, -- Adjust to where debugpy is installed
    }
  end,
  config = function ()
    return {
      {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          local cwd = vim.fn.getcwd()
          if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
            return cwd .. "/venv/bin/python"
          elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
            return cwd .. "/.venv/bin/python"
          else
            return "/usr/bin/python"
          end
        end,
      },
    }
  end,
}
return M
