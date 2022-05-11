-- nvim aerial

require("aerial").setup({
	lsp = {
		diagnostics_trigger_update = true,
		update_when_errors = true,
		update_delay = 300,
	},
	treesitter = { update_delay = 300 },
	filter_kind = false,
	on_attach = function(bufnr)
		local map = vim.api.nvim_buf_set_keymap
		map(bufnr, "n", "<leader>at", [[:AerialToggle!<cr>]], {})
		map(bufnr, "n", "{", [[:AerialPrevUp<cr>]], {})
		map(bufnr, "n", "}", [[:AerialNextUp<cr>]], {})
		map(bufnr, "n", "[[", [[:AerialPrev<cr>]], {})
		map(bufnr, "n", "]]", [[:AerialNext<cr>]], {})
	end,
	close_behavior = "close",
	nerd_font = true,
	highlight_on_hover = true,
})

vim.cmd([[hi link AerialClass Type]])
vim.cmd([[hi link AerialClassIcon Special]])
vim.cmd([[hi link AerialFunction Special]])
vim.cmd([[hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE]])
vim.cmd([[hi link AerialGuide Comment]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<leader>at", [[:AerialToggle<cr>]], opts)
