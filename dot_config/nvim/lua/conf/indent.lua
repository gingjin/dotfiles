-- nvim indent-blankline
--
local opt = vim.opt
opt.list = true
opt.listchars = { tab = "⇝ ", }

require("indent_blankline").setup({
  char = "▏", --⎸┆ ¦
  show_current_context = true,
  show_current_context_start = false,
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
})
