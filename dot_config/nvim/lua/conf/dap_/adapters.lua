local M = {}
local path = vim.fn.stdpath("data")
M.cpp = {
  adapter = {
    id = "cppdbg",
    type = "executable",
    command = path ..
        "/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7",
  },
  config = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
      args = {},
      runInTerminal = true,
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
}

M.go = {
  adapter = {
    type = "executable",
    command = "node",
    args = { path .. "/mason/packages/go-debug-adapter/extension/dist/debugAdapter.js" },
  },
  config = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      showLog = false,
      program = "${file}",
      dlvToolPath = vim.fn.exepath("dlv"), -- Adjust to where delve is installed
    },
  },
}

M.python = {
  adapter = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" }, -- Adjust to where debugpy is installed
  },
  config = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      console = "internalConsole",
    },
  },
}
return M
