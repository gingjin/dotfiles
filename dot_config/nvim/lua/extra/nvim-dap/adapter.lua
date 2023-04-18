local path = vim.fn.stdpath("data")
local M = {}

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
