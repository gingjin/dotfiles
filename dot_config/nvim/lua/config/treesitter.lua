-- nvim treesitter

-- for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
-- 	config.install_info.url = config.install_info.url:gsub(
-- 		"https://github.com/",
-- 		"https://ghproxy.com/https://github.com/"
-- 	)
-- end

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
	context_commentstring = { enable = true },
	playground = {
		enable = true,
		disable = {},
		updatetime = 25,
		persist_queries = false,
		keybindings = {
			toggle_query_editor = "o",
			toggle_hl_groups = "i",
			toggle_injected_languages = "t",
			toggle_anonymous_nodes = "a",
			toggle_language_display = "I",
			focus_language = "f",
			unfocus_language = "F",
			update = "R",
			goto_node = "<cr>",
			show_help = "?",
		},
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
})
