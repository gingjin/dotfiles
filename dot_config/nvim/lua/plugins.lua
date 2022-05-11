-- nvim packer

local packer = require("packer")
packer.init({
	auto_reload_compiled = true,
	git = {
		default_url_format = "https://ghproxy.com/https://github.com/%s",
	},
	display = {
		open_fn = function()
			return require("packer.util").float()
		end,
		working_sym = "",
		error_sym = "",
		done_sym = "",
		removed_sym = "",
		moved_sym = "",
		header_sym = "=",
		prompt_border = "double",
	},
})

local use = require("packer").use
packer.startup(function()
	use("h-hg/fcitx.nvim")
	use("ap/vim-css-color")
	use("tpope/vim-surround")
	use("jghauser/mkdir.nvim")
	use("mg979/vim-visual-multi")
	use("baskerville/vim-sxhkdrc")
	use("mechatroner/rainbow_csv")
	use("dstein64/vim-startuptime")
	use("Vimjas/vim-python-pep8-indent")
	use("gingjin/vim-neovim-youdao-translator")

	use({ "lervag/vimtex", config = [[require "config/vimtex"]] })
	use({ "chentau/marks.nvim", config = [[require "config/marks"]] })
	use({ "sbdchd/neoformat", config = [[require "config/neoformat"]] })
	use({ "folke/trouble.nvim", config = [[require "config/trouble"]] })
	use({ "kevinhwang91/rnvimr", config = [[require "config/rnvimr"]] })
	use({ "stevearc/aerial.nvim", config = [[require "config/aerial"]] })
	use({ "kdheepak/lazygit.nvim", config = [[require "config/lazygit"]] })
	use({ "windwp/nvim-autopairs", config = [[require "config/autopairs"]] })
	use({ "lewis6991/gitsigns.nvim", config = [[require "config/gitsigns"]] })
	use({ "nvim-lualine/lualine.nvim", config = [[require "config/lualine"]] })
	use({ "akinsho/toggleterm.nvim", config = [[require "config/toggleterm"]] })
	use({ "max397574/better-escape.nvim", config = [[require "config/escape"]] })
	use({ "sudormrfbin/cheatsheet.nvim", config = [[require "config/cheatsheet"]] })
	use({ "lukas-reineke/indent-blankline.nvim", config = [[require "config/indent"]] })

	use({
		"sainnhe/sonokai",
		config = [[require "config/colorscheme"]],
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
		config = [[require "config/nvim-tree"]],
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = [[require "config/treesitter"]],
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"tami5/lspsaga.nvim",
			"onsails/lspkind-nvim",
			"williamboman/nvim-lsp-installer",
		},
		config = [[require "config/lspconfig"]],
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-path",
			"rcarriga/cmp-dap",
			"David-Kunz/cmp-npm",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"lukas-reineke/cmp-under-comparator",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
		config = [[require "config/cmp"]],
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"tami5/sqlite.lua",
			"nvim-lua/popup.nvim",
			"nvim-lua/plenary.nvim",
			"tyru/open-browser.vim",
			"nvim-neorg/neorg-telescope",
			"kyazdani42/nvim-web-devicons",
			"benfowler/telescope-luasnip.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"dhruvmanila/telescope-bookmarks.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-symbols.nvim",
			"nvim-telescope/telescope-frecency.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"nvim-telescope/telescope-node-modules.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
		},
		config = [[require 'config/telescope']],
	})

	use({
		"numToStr/Comment.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"folke/todo-comments.nvim",
		},
		config = [[require "config/comment"]],
	})

	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = [[require 'config/markdown-preview']],
	})

	use({
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = [[require "config/dap"]],
	})
end)

local cmd = vim.api.nvim_command
cmd("augroup packer_user_config")
cmd("autocmd!")
cmd("autocmd BufWritePost plugins.lua source <afile> | PackerCompile")
cmd("augroup end")
