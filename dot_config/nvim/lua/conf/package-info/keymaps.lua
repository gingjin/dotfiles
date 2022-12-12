local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", opts)
keymap("n", "<leader>nh", ":lua require('package-info').hide()<CR>", opts)
keymap("n", "<leader>nu", ":lua require('package-info').update()<CR>", opts)
keymap("n", "<leader>nd", ":lua require('package-info').delete()<CR>", opts)
keymap("n", "<leader>ni", ":lua require('package-info').install()<CR>", opts)
keymap("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>", opts)
keymap("n", "<leader>np", ":lua require('package-info').change_version<CR>", opts)
