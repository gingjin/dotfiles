-- nvim packer
--
local packer = require("packer")
packer.init({
	auto_reload_compiled = true,
	git = { default_url_format = "https://github.com/%s" },
	display = {
		open_fn = function()
			return require("packer.util").float()
		end,
		working_sym = "",
		error_sym = "",
		done_sym = "",
		removed_sym = "",
		moved_sym = "",
		header_sym = "━",
		prompt_border = "double",
	},
	profile = {
		enable = true,
		threshold = 1,
	},
})

packer.startup(function(use)
	-- use({ "gingjin/vim-neovim-youdao-translator" })
	use({ "jghauser/mkdir.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "mg979/vim-visual-multi" })
	use({ "dstein64/vim-startuptime" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "sainnhe/sonokai", config = [[require "conf/colorscheme"]] })

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"tyru/open-browser.vim",
			"nvim-telescope/telescope-symbols.nvim",
			{ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" },
			{ "nvim-telescope/telescope-packer.nvim", module = "telescope._extensions.packer" },
			{ "dhruvmanila/telescope-bookmarks.nvim", module = "telescope._extensions.bookmarks" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make", module = "telescope._extensions.fzf" },
		},
		config = [[require "conf/telescope"]],
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"tami5/lspsaga.nvim",
			"williamboman/nvim-lsp-installer",
		},
		config = [[require "conf/lspconf/init"]],
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
		},
		config = [[require "conf/treesitter"]],
	})

	use({
		"L3MON4D3/LuaSnip",
		requires = "rafamadriz/friendly-snippets",
		config = [[require "conf/snippets"]],
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			--hirdparty
			"rcarriga/cmp-dap",
			"saadparwaiz1/cmp_luasnip",
			"ray-x/cmp-treesitter",
			"lukas-reineke/cmp-under-comparator",
		},
		config = [[require "conf/autocompletion"]],
	})

	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = [[require "conf/dapconf/init"]],
	})

	use({ "sbdchd/neoformat", after = "nvim-cmp", config = [[require "conf/format"]] })
	use({ "mfussenegger/nvim-lint", after = "nvim-cmp", config = [[require "conf/lint"]] })
	use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = [[require "conf/autopairs"]] })
	use({ "nvim-lualine/lualine.nvim", after = "sonokai", config = [[require "conf/lualine"]] })
	use({ "kyazdani42/nvim-tree.lua", after = "sonokai", config = [[require "conf/nvim-tree"]] })
	use({ "numToStr/Comment.nvim", after = "nvim-treesitter", config = [[require "conf/comment"]] })
	use({ "lukas-reineke/indent-blankline.nvim", after = "nvim-treesitter", config = [[require "conf/indent"]] })

	use({ "tpope/vim-surround", event = "InsertCharPre" })
	use({ "kevinhwang91/rnvimr", event = "BufRead", config = [[require "conf/rnvimr"]] })
	use({ "chentoast/marks.nvim", event = "BufRead", config = [[require "conf/marks"]] })
	use({ "stevearc/aerial.nvim", event = "BufRead", config = [[require "conf/aerial"]] })
	use({ "folke/todo-comments.nvim", event = "BufRead", config = [[require "conf/todo"]] })
	use({ "kdheepak/lazygit.nvim", event = "BufRead", config = [[require "conf/lazygit"]] })
	use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = [[require "conf/gitsigns"]] })
	use({ "akinsho/toggleterm.nvim", event = "BufRead", config = [[require "conf/toggleterm"]] })
	use({ "norcalli/nvim-colorizer.lua", event = "BufRead", config = [[require "conf/colorizer"]] })
	use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = [[require "conf/escape"]] })

	use({ "mechatroner/rainbow_csv", ft = "csv" })
	use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })
	use({ "Vimjas/vim-python-pep8-indent", ft = "python" })
	use({ "lervag/vimtex", config = [[require "conf/vimtex"]], ft = { "tex", "bib" } })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = [[require 'conf/markdown-preview']],
		ft = "markdown",
	})
end)

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local packer_group = augroup("Packer", { clear = true })
cmd("BufWritePost", {
	group = packer_group,
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})
