local opts = { noremap = true, silent = true }
local G = require("G")
G.map({
  { "n", "<leader>gg", ":LazyGit<CR>", opts },
})
