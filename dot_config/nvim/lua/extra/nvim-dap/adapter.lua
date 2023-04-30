local M = {}

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
