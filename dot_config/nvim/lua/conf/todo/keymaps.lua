local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<leader>tl", ":TodoLocList<CR>", opts)
keymap("n", "<leader>tq", ":TodoQuickFix<CR>", opts)
keymap("n", "<leader>tt", ":TodoTelescope<CR>", opts)
