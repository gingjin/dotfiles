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
	use({ "jghauser/mkdir.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "mg979/vim-visual-multi" })
	use({ "dstein64/vim-startuptime" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "rafamadriz/friendly-snippets" })
	use({ "gingjin/vim-neovim-youdao-translator" })
	use({ "sainnhe/sonokai", config = [[require "config/colorscheme"]] })
	use({ "nvim-lualine/lualine.nvim", config = [[require "config/lualine"]] })
	use({ "kyazdani42/nvim-tree.lua", config = [[require "config/nvim-tree"]] })

	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/popup.nvim",
			"tyru/open-browser.vim",
			"nvim-telescope/telescope-symbols.nvim",
			{ "benfowler/telescope-luasnip.nvim", module = "telescope._extensions.luasnip" },
			{ "nvim-telescope/telescope-packer.nvim", module = "telescope._extensions.packer" },
			{ "dhruvmanila/telescope-bookmarks.nvim", module = "telescope._extensions.bookmarks" },
			{ "nvim-telescope/telescope-node-modules.nvim", module = "telescope._extensions.node_modules" },
			{ "nvim-telescope/telescope-fzf-native.nvim", run = "make", module = "telescope._extensions.fzf" },
		},
		config = [[require "config/telescope"]],
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

	use({ "L3MON4D3/LuaSnip", config = [[require "config/snippets"]] })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-calc", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-cmdline", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp"},
			{ "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-lspconfig" },
			{ "hrsh7th/cmp-nvim-lsp-document-symbol", after = "nvim-lspconfig" },
			-- thirdparty
			{ "rcarriga/cmp-dap", after = "nvim-dap" },
			{ "David-Kunz/cmp-npm", after = "LuaSnip" },
			{ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" },
			{ "ray-x/cmp-treesitter", after = "nvim-treesitter" },
			{ "lukas-reineke/cmp-under-comparator"},
		},
		config = [[require "config/autocompletion"]],
	})

	use({ "mfussenegger/nvim-dap", event = "BufRead", config = [[require "config/dapconfig"]] })
	use({ "rcarriga/nvim-dap-ui", after = "nvim-dap", config = [[require "config/dapui"]] })
	use({ "theHamsta/nvim-dap-virtual-text", after = "nvim-dap", config = [[require "config/daptext"]] })

	use({ "neovim/nvim-lspconfig", after='LuaSnip', config = [[require "config/lsp"]] })
	use({ "tami5/lspsaga.nvim", after = "nvim-lspconfig", config = [[require "config/lspsaga"]] })
	use({ "williamboman/nvim-lsp-installer", after = "nvim-lspconfig", config = [[require "config/lsp_install"]] })

	use({ "sbdchd/neoformat", after = "nvim-cmp", config = [[require "config/neoformat"]] })
	use({ "mfussenegger/nvim-lint", after = "nvim-cmp", config = [[require "config/lint"]] })
	use({ "stevearc/aerial.nvim", after = "nvim-cmp", config = [[require "config/aerial"]] })
	use({ "numToStr/Comment.nvim", after = "nvim-cmp", config = [[require "config/comment"]] })
	use({ "folke/todo-comments.nvim", after = "nvim-cmp", config = [[require "config/todo"]] })
	use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = [[require "config/autopairs"]] })
	use({ "lukas-reineke/indent-blankline.nvim", after = "nvim-treesitter", config = [[require "config/indent"]] })

	use({ "tpope/vim-surround", event = "InsertCharPre" })
	use({ "kevinhwang91/rnvimr", event = "BufRead", config = [[require "config/rnvimr"]] })
	use({ "chentoast/marks.nvim", event = "BufRead", config = [[require "config/marks"]] })
	use({ "kdheepak/lazygit.nvim", event = "BufRead", config = [[require "config/lazygit"]] })
	use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = [[require "config/gitsigns"]] })
	use({ "akinsho/toggleterm.nvim", event = "BufRead", config = [[require "config/toggleterm"]] })
	use({ "norcalli/nvim-colorizer.lua", event = "BufRead", config = [[require "config/colorizer"]] })
	use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = [[require "config/escape"]] })

	use({ "mechatroner/rainbow_csv", ft = "csv" })
	use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })
	use({ "Vimjas/vim-python-pep8-indent", ft = "python" })
	use({ "lervag/vimtex", config = [[require "config/vimtex"]], ft = { "tex", "bib" } })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = [[require 'config/markdown-preview']],
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
