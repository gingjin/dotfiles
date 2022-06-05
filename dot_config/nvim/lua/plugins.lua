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
  profile = { enable = true, threshold = 1 },
})

packer.startup(function(use)
  use({ "sainnhe/sonokai" })

  use({ "jghauser/mkdir.nvim" })
  use({ "dstein64/vim-startuptime" })
  use({ "kyazdani42/nvim-web-devicons" })

  use({ "nvim-lualine/lualine.nvim", config = [[require "conf.lualine"]] })
  use({ "kyazdani42/nvim-tree.lua", config = [[require "conf.nvim-tree"]] })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = [[require "conf.treesitter"]],
  })

  use({
    "L3MON4D3/LuaSnip",
    requires = "rafamadriz/friendly-snippets",
    config = [[require "conf.snippets"]],
  })

  use({
    "neovim/nvim-lspconfig",
    requires = {
      "williamboman/nvim-lsp-installer",
    },
    config = [[require "conf.lsp_.init"]],
  })

  use({
    "mfussenegger/nvim-dap",
    requires = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = [[require "conf.dap_.init"]],
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
      "rcarriga/cmp-dap",
      "David-Kunz/cmp-npm",
      "ray-x/cmp-treesitter",
      "windwp/nvim-autopairs",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
    },
    config = [[require "conf.cmp_.init"]],
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-dap.nvim",
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-node-modules.nvim",
      "nvim-telescope/telescope-fzf-native.nvim", run = "make",
      "tyru/open-browser.vim",
      "benfowler/telescope-luasnip.nvim",
      "dhruvmanila/telescope-bookmarks.nvim",
    },
    config = [[require "conf.telescope"]],
  })

  use({
    "tpope/vim-dadbod",
    requires = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    ft = { "sql", "mysql", "plsql" },
    config = [[require "conf.dadbod"]],
  })

  use({
    "skywind3000/asynctasks.vim",
    requires = "skywind3000/asyncrun.vim",
    config = [[require "conf.tasks"]],
  })

  use({ "h-hg/fcitx.nvim", event = "BufRead" })
  use({ "tpope/vim-surround", event = "BufRead" })
  use({ "mg979/vim-visual-multi", event = "BufRead" })
  use({ "voldikss/vim-translator", event = "BufRead" })
  use({ "sbdchd/neoformat", event = "BufRead", config = [[require "conf.format"]] })
  use({ "kevinhwang91/rnvimr", event = "BufRead", config = [[require "conf.rnvimr"]] })
  use({ "chentoast/marks.nvim", event = "BufRead", config = [[require "conf.marks"]] })
  use({ "mfussenegger/nvim-lint", event = "BufRead", config = [[require "conf.lint"]] })
  use({ "folke/zen-mode.nvim", event = "BufRead", config = [[require "conf.zen-mode"]] })
  use({ "numToStr/Comment.nvim", event = "BufRead", config = [[require "conf.comment"]] })
  use({ "folke/todo-comments.nvim", event = "BufRead", config = [[require "conf.todo"]] })
  use({ "kdheepak/lazygit.nvim", event = "BufRead", config = [[require "conf.lazygit"]] })
  use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = [[require "conf.gitsigns"]] })
  use({ "akinsho/toggleterm.nvim", event = "BufRead", config = [[require "conf.toggleterm"]] })
  use({ "norcalli/nvim-colorizer.lua", event = "BufRead", config = [[require "conf.colorizer"]] })
  use({ "simrat39/symbols-outline.nvim", event = "BufRead", config = [[require "conf.outline"]] })
  use({ "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = [[require "conf.indent"]] })
  use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = [[require "conf.escape"]] })

  use({ "mechatroner/rainbow_csv", ft = "csv" })
  use({ "baskerville/vim-sxhkdrc", ft = "sxhkdrc" })
  use({
    "lervag/vimtex",
    ft = "tex",
    config = [[require "conf.vimtex"]]
  })
  use({
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    ft = "json",
    config = [[require "conf.package-info"]],
  })
  use({
    "iamcco/markdown-preview.nvim",
    run = "cd app && yarn install",
    ft = "markdown",
    config = [[require "conf.mkdp"]],
  })
  use({
    "nvim-neorg/neorg",
    requires = {
      "max397574/neorg-kanban",
      "nvim-neorg/neorg-telescope",
    },
    ft = "norg",
    config = [[require "conf.neorg"]],
  })
end)

local cmd = vim.api.nvim_create_autocmd
local group = vim.api.nvim_create_augroup
local packer_group = group("Packer", { clear = true })
cmd("BufWritePost", {
  group = packer_group,
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})
