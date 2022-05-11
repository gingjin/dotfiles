local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- translator
map("v", "<C-t>", [[:<C-u>Ydv<cr>]], opts)
map("n", "<C-t>", [[:<C-u>Ydc<cr>]], opts)

-- indent code
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- jump window
map("n", "<A-h>", "<C-w>h", opts)
map("n", "<A-j>", "<C-w>j", opts)
map("n", "<A-k>", "<C-w>k", opts)
map("n", "<A-l>", "<C-w>l", opts)

-- resize window
map("n", "<A-up>", "<C-w>10+", opts)
map("n", "<A-down>", "<C-w>10-", opts)
map("n", "<A-left>", "<C-w>10<", opts)
map("n", "<A-right>", "<C-w>10>", opts)

-- move the cursor in insert mode
map("i", "<A-h>", "<left>", opts)
map("i", "<A-j>", "<down>", opts)
map("i", "<A-k>", "<up>", opts)
map("i", "<A-l>", "<right>", opts)

-- quickly jump to the beginning and end of a line
map("n", "L", "$", opts)
map("n", "H", "^", opts)

-- select all
map("n", "<C-a>", "gg<S-v>G", opts)

-- save the file
map("n", "<C-s>", [[:wa<cr>]], opts)

-- save and close the file
map("n", "<C-q>", [[:wq<cr>]], opts)
