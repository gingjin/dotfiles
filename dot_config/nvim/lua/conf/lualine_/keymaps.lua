local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

keymap("n", "<leader>1", ":LualineBuffersJump 1<CR>", opts)
keymap("n", "<leader>2", ":LualineBuffersJump 2<CR>", opts)
keymap("n", "<leader>3", ":LualineBuffersJump 3<CR>", opts)
keymap("n", "<leader>4", ":LualineBuffersJump 4<CR>", opts)
keymap("n", "<leader>5", ":LualineBuffersJump 5<CR>", opts)
keymap("n", "<leader>6", ":LualineBuffersJump 6<CR>", opts)
keymap("n", "<leader>7", ":LualineBuffersJump 7<CR>", opts)
keymap("n", "<leader>8", ":LualineBuffersJump 8<CR>", opts)
keymap("n", "<leader>9", ":LualineBuffersJump 9<CR>", opts)
keymap("n", "<leader>0", ":LualineBuffersJump 10<CR>", opts)
