-- nvim treesitter

for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
	config.install_info.url = config.install_info.url:gsub(
		"https://github.com/",
		"https://ghproxy.com/https://github.com/"
	)
end

require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	ignore_install = { "swift" },
	sync_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true },
	autotag = { enable = true },
	rainbow = {
		enable = true,
		extended_mode = true,
		max_file_lines = nil,
	},
	context_commentstring = {
		enable = true,
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
})
