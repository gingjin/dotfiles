local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
keymap('n', '<leader>tv', '<Plug>Translate', opts)
keymap('v', '<leader>tv', '<Plug>TranslateV', opts)
keymap('n', '<leader>tw', '<Plug>TranslateW', opts)
keymap('v', '<leader>tw', '<Plug>TranslateWV', opts)
