local g = vim.g
g.asyncrun_open = 10
g.asynctasks_term_rows = 10
g.asynctasks_term_cols = 80
g.asynctasks_config_name = "tasks.ini"
g.asynctasks_extra_config = {
  os.getenv("HOME") .. "/.config/nvim/lua/plugins/tasks/tasks.ini",
}

local G = require("G")
G.map({
  { "n", "<F9>", ":AsyncTask file-build<CR>" },
  { "n", "<F10>", ":AsyncTask file-run<CR>" },
})
