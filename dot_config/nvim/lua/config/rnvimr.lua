-- nvim ranger

local g = vim.g
g.rnvimr_enable_ex = 1
g.rnvimr_enable_picker = 1
g.rnvimr_hide_gitignore = 1
g.rnvimr_border_attr = { fg = 14, bg = -1 }
g.rnvimr_enable_bw = 1

vim.cmd("highlight link RnvimrNormal CursorLine")

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("t", "<A-i>", [[<C-\><C-n>:RnvimrResize<CR>]], opts)
map("n", "<A-r>", [[:RnvimrToggle<CR>]], opts)
map("t", "<A-r>", [[<C-\><C-n>:RnvimrToggle<CR>]], opts)
