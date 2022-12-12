local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("t", "<A-i>", "<C-\\><C-n>:RnvimrResize<CR>", opts)
keymap("n", "<A-r>", ":RnvimrToggle<CR>", opts)
keymap("t", "<A-r>", "<C-\\><C-n>:RnvimrToggle<CR>", opts)
