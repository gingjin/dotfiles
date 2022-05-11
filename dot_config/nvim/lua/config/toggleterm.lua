-- nvim toggleterm

require("toggleterm").setup({
	size = 10,
	open_mapping = [[<A-t>]],
	shade_terminals = false,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	close_on_exit = true,
	shell = vim.o.shell,
	-- direction = "horizontal",
	direction = "float",
	float_opts = {
		border = "double",
		-- winblend = 3,
	},
	highlights = {
		Normal = {
			guibg = "NONE",
			ctermbg = "NONE",
		},
	},
})

function _G.set_terminal_keymaps()
	local map = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true }
	map(0, "t", "<esc>", [[<C-\><C-n>]], opts)
	map(0, "t", "<A-h>", [[<C-\><C-n><C-w>h]], opts)
	map(0, "t", "<A-j>", [[<C-\><C-n><C-w>j]], opts)
	map(0, "t", "<A-k>", [[<C-\><C-n><C-w>k]], opts)
	map(0, "t", "<A-l>", [[<C-\><C-n><C-w>l]], opts)
end

local cmd = vim.api.nvim_command
cmd([[autocmd! TermOpen term://* lua set_terminal_keymaps()]])
