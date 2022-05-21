-- nvim toggleterm
--
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
