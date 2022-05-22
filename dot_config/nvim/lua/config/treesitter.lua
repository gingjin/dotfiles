-- nvim treesitter
--
require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = {},
	sync_install = false,
	highlight = {
		enable = true,
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
	context_commentstring = {
		enable = true,
		config = {
			{ css = "// %s" },
			{
				javascript = {
					__default = "// %s",
					jsx_element = "{/* %s */}",
					jsx_fragment = "{/* %s */}",
					jsx_attribute = "// %s",
					comment = "// %s",
				},
			},
			{
				typescript = {
					__default = "// %s",
					__multiline = "/* %s */",
				},
			},
		},
	},
})
