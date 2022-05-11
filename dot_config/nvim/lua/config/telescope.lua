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
				["<C-u>"] = true,
				["<C-d>"] = true,
				["<C-t>"] = trouble.open_with_trouble,
			},
			n = {
				["<C-t>"] = trouble.open_with_trouble,
			},
		},
		width = 0.8,
		previewer = true,
		prompt_title = true,
		file_ignore_patterns = { "./node_modules" },
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

local cmd = vim.cmd
cmd([[hi TelescopeBorder   guifg=#2a2e36]])
cmd([[hi TelescopePromptBorder   guifg=#2a2e36]])
cmd([[hi TelescopeResultsBorder  guifg=#2a2e36]])
cmd([[hi TelescopePreviewBorder  guifg=#525865]])
cmd([[autocmd User TelescopePreviewerLoaded setlocal wrap]])

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<A-/>", [[:Telescope frecency<cr>]], opts)
map("n", "<leader><space>", [[:Telescope<cr>]], opts)
map("n", "<leader>fp", [[:Telescope packer<cr>]], opts)
map("n", "<leader>fb", [[:Telescope buffers<cr>]], opts)
map("n", "<leader>fs", [[:Telescope symbols<cr>]], opts)
map("n", "<leader>fl", [[:Telescope luasnip<cr>]], opts)
map("n", "<leader>fm", [[:Telescope bookmarks<cr>]], opts)
map("n", "<leader>fg", [[:Telescope live_grep<cr>]], opts)
map("n", "<leader>fh", [[:Telescope help_tags<cr>]], opts)
map("n", "<leader>ff", [[:Telescope find_files<cr>]], opts)
