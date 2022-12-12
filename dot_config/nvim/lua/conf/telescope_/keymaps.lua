local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader><space>", ":Telescope<CR>", opts)
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fc", ":Telescope commands<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)

keymap("n", "<leader>fa", ":Telescope aerial<CR>", opts)
keymap("n", "<leader>fp", ":Telescope packer<CR>", opts)
keymap("n", "<leader>fs", ":Telescope symbols<CR>", opts)
keymap("n", "<leader>fl", ":Telescope luasnip<CR>", opts)
keymap("n", "<leader>fm", ":Telescope bookmarks<CR>", opts)
keymap("n", "<leader>fn", ":Telescope node_modules list<CR>", opts)
