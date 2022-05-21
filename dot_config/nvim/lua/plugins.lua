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
	use({ "jghauser/mkdir.nvim" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "dstein64/vim-startuptime" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({ "L3MON4D3/LuaSnip", config = [[require "config/snippets"]] })
	use({ "sainnhe/sonokai", config = [[require "config/colorscheme"]] })
	use({ "nvim-lualine/lualine.nvim", config = [[require "config/lualine"]] })
	use({ "kyazdani42/nvim-tree.lua", config = [[require "config/nvim-tree"]] })

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"windwp/nvim-ts-autotag",
			"nvim-treesitter/playground",
			"JoosepAlviste/nvim-ts-context-commentstring",
		},
		config = [[require "config/treesitter"]],
	})

	use({
		"hrsh7th/nvim-cmp",
		after = "LuaSnip",
		requires = {
			"hrsh7th/cmp-calc",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
			-- thirdparty
			"rcarriga/cmp-dap",
			"David-Kunz/cmp-npm",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"lukas-reineke/cmp-under-comparator",
		},
		config = [[require "config/autocompletion"]],
	})

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

	use({ "mechatroner/rainbow_csv", ft = "csv" })
	use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })
	use({ "Vimjas/vim-python-pep8-indent", ft = "python" })
	use({ "lervag/vimtex", config = [[require "config/vimtex"]], ft = "tex" })
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && yarn install",
		config = [[require 'config/markdown-preview']],
		ft = "markdown",
	})

	use({ "rcarriga/nvim-dap-ui", after = "nvim-dap", config = [[require "config/dapui"]] })
	use({ "mfussenegger/nvim-dap", after = "nvim-cmp", config = [[require "config/dapconfig"]] })
	use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = [[require "config/autopairs"]] })
	use({ "tami5/lspsaga.nvim", after = "nvim-lspconfig", config = [[require "config/lspsaga"]] })
	use({ "theHamsta/nvim-dap-virtual-text", after = "nvim-dap", config = [[require "config/daptext"]] })
	use({ "williamboman/nvim-lsp-installer", after = "nvim-lspconfig", config = [[require "config/lsp_install"]] })

	use({ "h-hg/fcitx.nvim", event = "VimEnter" })
	use({ "tpope/vim-surround", event = "VimEnter" })
	use({ "mg979/vim-visual-multi", event = "VimEnter" })
	use({ "rafamadriz/friendly-snippets", event = "InsertCharPre" })
	use({ "gingjin/vim-neovim-youdao-translator", event = "VimEnter" })
	use({ "neovim/nvim-lspconfig", event = "VimEnter", config = [[require "config/lsp"]] })
	use({ "sbdchd/neoformat", event = "VimEnter", config = [[require "config/neoformat"]] })
	use({ "folke/trouble.nvim", event = "VimEnter", config = [[require "config/trouble"]] })
	use({ "kevinhwang91/rnvimr", event = "BufNew", config = [[require "config/rnvimr"]] })
	use({ "chentoast/marks.nvim", event = "VimEnter", config = [[require "config/marks"]] })
	use({ "stevearc/aerial.nvim", event = "VimEnter", config = [[require "config/aerial"]] })
	use({ "mfussenegger/nvim-lint", event = "VimEnter", config = [[require "config/lint"]] })
	use({ "numToStr/Comment.nvim", event = "VimEnter", config = [[require "config/comment"]] })
	use({ "kdheepak/lazygit.nvim", event = "VimEnter", config = [[require "config/lazygit"]] })
	use({ "folke/todo-comments.nvim", event = "VimEnter", config = [[require "config/todo"]] })
	use({ "lewis6991/gitsigns.nvim", event = "VimEnter", config = [[require "config/gitsigns"]] })
	use({ "akinsho/toggleterm.nvim", event = "VimEnter", config = [[require "config/toggleterm"]] })
	use({ "norcalli/nvim-colorizer.lua", event = "VimEnter", config = [[require "config/colorizer"]] })
	use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = [[require "config/escape"]] })
	use({ "lukas-reineke/indent-blankline.nvim", event = "VimEnter", config = [[require "config/indent"]] })
end)

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local packer_group = augroup("Packer", { clear = true })
cmd("BufWritePost", {
	group = packer_group,
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})
