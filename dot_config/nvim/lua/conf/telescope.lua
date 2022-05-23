-- nvim telescope
--
local tele = require("telescope")
tele.setup({
	defaults = {
		multi_icon = "",
		prompt_prefix = " ",
		selection_caret = " ",
		width = 0.8,
		previewer = true,
		prompt_title = true,
		file_ignore_patterns = { "__pycache__", ".git" },
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
		bookmarks = {
			selected_browser = "chrome",
			url_open_command = "open",
			url_open_plugin = "open_browser",
			full_path = true,
			firefox_profile_name = nil,
		},
		symbols = {
			sources = { "emoji", "kaomoji", "gitmoji", "latex", "math" },
		},
	},
})

tele.load_extension("fzf")
tele.load_extension("packer")
tele.load_extension("luasnip")
tele.load_extension("bookmarks")
