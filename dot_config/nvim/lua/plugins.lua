-- nvim packer
--
local packer = require("packer")
packer.init({
	auto_reload_compiled = true,
	-- git = { default_url_format = "https://ghproxy.com/https://github.com/%s" },
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
	use("h-hg/fcitx.nvim")
	use("tpope/vim-surround")
	use("jghauser/mkdir.nvim")
	use("nvim-lua/plenary.nvim")
	use("mg979/vim-visual-multi")
	use("baskerville/vim-sxhkdrc")
	use("mechatroner/rainbow_csv")
	use("dstein64/vim-startuptime")
	use("kyazdani42/nvim-web-devicons")
	use("Vimjas/vim-python-pep8-indent")
	use("gingjin/vim-neovim-youdao-translator")

	use({ "lervag/vimtex", config = [[require "config/vimtex"]] })
	use({ "chentoast/marks.nvim", config = [[require "config/marks"]] })
	use({ "sbdchd/neoformat", config = [[require "config/neoformat"]] })
	use({ "folke/trouble.nvim", config = [[require "config/trouble"]] })
	use({ "kevinhwang91/rnvimr", config = [[require "config/rnvimr"]] })
	use({ "mfussenegger/nvim-lint", config = [[require "config/lint"]] })
	use({ "stevearc/aerial.nvim", config = [[require "config/aerial"]] })
	use({ "kdheepak/lazygit.nvim", config = [[require "config/lazygit"]] })
	use({ "windwp/nvim-autopairs", config = [[require "config/autopairs"]] })
	use({ "lewis6991/gitsigns.nvim", config = [[require "config/gitsigns"]] })
	use({ "nvim-lualine/lualine.nvim", config = [[require "config/lualine"]] })
	use({ "kyazdani42/nvim-tree.lua", config = [[require "config/nvim-tree"]] })
	use({ "akinsho/toggleterm.nvim", config = [[require "config/toggleterm"]] })
	use({ "max397574/better-escape.nvim", config = [[require "config/escape"]] })
	use({ "norcalli/nvim-colorizer.lua", config = [[require "config/colorizer"]] })
	use({ "lukas-reineke/indent-blankline.nvim", config = [[require "config/indent"]] })

	use({
		"sainnhe/sonokai",
		config = [[require "config/colorscheme"]],
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = [[require "config/treesitter"]],
		run = ":TSUpdate",
	})

	use({
		"neovim/nvim-lspconfig",
		requires = {
			"tami5/lspsaga.nvim",
			"williamboman/nvim-lsp-installer",
		},
		config = [[require "config/lsp"]],
	})

	use({
		"L3MON4D3/LuaSnip",
		requires = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
		config = [[require "config/snippets"]],
	})

	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			-- thirdparty
			"rcarriga/cmp-dap",
			"David-Kunz/cmp-npm",
			"ray-x/cmp-treesitter",
			"lukas-reineke/cmp-under-comparator",
		},
		config = [[require "config/autocompletion"]],
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"tami5/sqlite.lua",
			"nvim-lua/popup.nvim",
			"tyru/open-browser.vim",
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
		config = [[require "config/telescope"]],
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

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local packer_group = augroup("Packer", { clear = true })
cmd("BufWritePost", {
	group = packer_group,
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})
