local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<A-f>", ":Format<CR>", opts)
keymap("n", "<A-F>", ":FormatWrite<CR>", opts)
