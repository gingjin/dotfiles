local g = vim.g
g.rnvimr_enable_ex = 0
g.rnvimr_enable_picker = 1
g.rnvimr_hide_gitignore = 1
g.rnvimr_draw_border = 1
g.rnvimr_border_attr = { fg = 14, bg = -1 }
g.rnvimr_enable_bw = 1
vim.cmd("highlight link RnvimrNormal CursorLine")

local G = require("G")
G.map({
  { "n", "<A-r>", ":RnvimrToggle<CR>" },
  { "t", "<A-r>", "<C-\\><C-n>:RnvimrToggle<CR>" },
  { "t", "<A-i>", "<C-\\><C-n>:RnvimrResize<CR>" },
})
