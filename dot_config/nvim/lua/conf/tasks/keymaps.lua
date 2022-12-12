local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<F9>", ":AsyncTask file-build<CR>", opts)
keymap("n", "<F10>", ":AsyncTask file-run<CR>", opts)
