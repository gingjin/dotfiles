-- nvim telescope

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local tele = require("telescope")
tele.setup({
	defaults = {
		multi_icon = "",
		prompt_prefix = " ",
		selection_caret = " ",
		mappings = {
			i = {
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-t>"] = trouble.open_with_trouble,
			},
		},
		width = 0.8,
		previewer = true,
		prompt_title = true,
		file_ignore_patterns = { "node_modules", "__pycache__", ".git" },
	},
	extensions = {
		media_files = {
			filetypes = { "gif", "png", "webp", "jpg", "jpeg", "mp4", "pdf" },
			find_cmd = "fd",
		},
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
		["ui-select"] = {
			require("telescope.themes").get_dropdown({}),
		},
	},
})

tele.load_extension("dap")
tele.load_extension("fzf")
tele.load_extension("aerial")
tele.load_extension("packer")
tele.load_extension("luasnip")
tele.load_extension("lazygit")
tele.load_extension("frecency")
tele.load_extension("ui-select")
tele.load_extension("bookmarks")
tele.load_extension("media_files")
tele.load_extension("node_modules")
