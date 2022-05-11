-- markdown-preview

local g = vim.g
g.mkdp_auto_start = 0
g.mkdp_auto_close = 1
g.mkdp_refresh_slow = 1
g.mkdp_page_title = "『${name}』"

local map = vim.api.nvim_set_keymap
map("n", "<leader>mp", [[<Plug>MarkdownPreviewToggle]], {})
