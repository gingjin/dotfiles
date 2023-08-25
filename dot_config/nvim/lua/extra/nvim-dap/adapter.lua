local M = {}

M.codelldb = {
  adapter = {
    type = "server",
    host = '127.0.0.1',
    port = "${port}",
    executable = {
      command = vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/adapter/codelldb",
      args = { "--port", "${port}" },
      detached = false,
    },
  },
  config = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
    },
  },
}

M.debugpy = {
  adapter = {
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python",
    args = { "-m", "debugpy.adapter" },
  },
  config = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      justMyCode = false,
      program = "${file}",
      console = "internalConsole",
    },
  },
}

return M
