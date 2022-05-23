-- nvim treesitter
--
require("nvim-treesitter.configs").setup({
	-- ensure_installed = "all",
	ensure_installed = {
		"lua",
		"c",
		"cpp",
		"python",
		"html",
		"css",
		"json",
		"markdown",
		"bash",
		"go",
		"help",
		"java",
		"javascript",
		"json5",
		"vim",
		"yaml",
	},
	ignore_install = {},
	sync_install = false,
	highlight = {
		enable = true,
		disable = { "latex" },
		additional_vim_regex_highlighting = false,
	},
	indent = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	autotag = { enable = true },
})
