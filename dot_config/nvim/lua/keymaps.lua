local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- roll
keymap("n", "<C-u>", "9k", opts)
keymap("n", "<C-d>", "9j", opts)

-- buffer
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- split
keymap("n", "<leader>sh", ":sp<CR>", opts)
keymap("n", "<leader>sv", ":vsp<CR>", opts)

-- indent code
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- close the current window
keymap("n", "<leader>sc", "<C-w>c", opts)
-- close other windows
keymap("n", "<leader>so", "<C-w>o", opts)

-- jump window
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- resize window
keymap("n", "<A-up>", "<C-w>10+", opts)
keymap("n", "<A-down>", "<C-w>10-", opts)
keymap("n", "<A-left>", "<C-w>10<", opts)
keymap("n", "<A-right>", "<C-w>10>", opts)

-- move the cursor in insert mode
keymap("i", "<A-h>", "<left>", opts)
keymap("i", "<A-j>", "<down>", opts)
keymap("i", "<A-k>", "<up>", opts)
keymap("i", "<A-l>", "<right>", opts)

-- quickly jump to the beginning and end of a line
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)

-- save the file
keymap("n", "<leader>w", ":wa<CR>", opts)

-- save and close the file
keymap("n", "<leader>Q", ":wq<CR>", opts)
