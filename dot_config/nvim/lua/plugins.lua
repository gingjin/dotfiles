local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  {
    "hrsh7th/nvim-cmp",
    config = function()
      require("plugins.cmp_.init")
    end,
    dependencies = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
    },
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("plugins.cmp_.autopairs.init")
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("plugins.cmp_.snippets.init")
    end,
    dependencies = { "rafamadriz/friendly-snippets" },
  },
  {
    "noib3/nvim-cokeline",
    config = function()
      require("plugins.cokeline.init")
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    event = "BufRead",
    config = function()
      require("plugins.colorizer.init")
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
    config = function()
      require("plugins.comment.init")
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("plugins.comment.todo.init")
    end,
  },
  {
    "mfussenegger/nvim-dap",
    event = "BufRead",
    config = function()
      require("plugins.dap_.init")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    event = "BufRead",
    config = function()
      require("plugins.dap_.ui.init")
    end,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    event = "BufRead",
    config = function()
      require("plugins.dap_.virtual_text.init")
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require("plugins.escape.init")
    end,
  },
  {
    "feline-nvim/feline.nvim",
    config = function()
      require("plugins.feline.init")
    end,
    dependencies = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "mhartington/formatter.nvim",
    event = "BufRead",
    config = function()
      require("plugins.formatter.init")
    end,
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
    config = function()
      require("plugins.git.diff.init")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = function()
      require("plugins.git.signs.init")
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("plugins.indent.init")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    config = function()
      require("plugins.lazygit.init")
    end,
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufRead",
    config = function()
      require("plugins.lint.init")
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.lsp.init")
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    config = function()
      require("plugins.lsp.lspsaga.init")
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "BufRead",
    config = function()
      require("plugins.marks.init")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && npm install",
    ft = { "markdown" },
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    config = function()
      require("plugins.mkdp.init")
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("plugins.nightfox.init")
    end,
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      require("plugins.notify.init")
    end,
  },
  {
    "kyazdani42/nvim-tree.lua",
    config = function()
      require("plugins.nvimtree.init")
    end,
  },
  {
    "kevinhwang91/rnvimr",
    keys = {
      { "<A-r>", ":RnvimrToggle<CR>" },
    },
    config = function()
      require("plugins.rnvimr.init")
    end,
  },
  {
    "skywind3000/asynctasks.vim",
    event = "BufRead",
    config = function()
      require("plugins.tasks.init")
    end,
    dependencies = { { "skywind3000/asyncrun.vim", event = "BufRead" } },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("plugins.telescope.init")
    end,
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
      "tsakirist/telescope-lazy.nvim",
      "benfowler/telescope-luasnip.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
  {
    "akinsho/toggleterm.nvim",
    keys = {
      { "<A-t>", ":ToggleTerm<CR>" },
    },
    config = function()
      require("plugins.toggleterm.init")
    end,
  },
  {
    "voldikss/vim-translator",
    event = "BufRead",
    config = function()
      require("plugins.translator.init")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("plugins.treesitter.init")
    end,
    dependencies = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    build = function()
      local ts_update = require("nvim-treesitter.install").update()
      ts_update()
    end,
  },
  {
    "lervag/vimtex",
    config = function()
      require("plugins.vimtex.init")
    end,
  },
  {
    "folke/zen-mode.nvim",
    event = "BufRead",
    config = function()
      require("plugins.zenmode.init")
    end,
  },
  { "jghauser/mkdir.nvim" },
  { "h-hg/fcitx.nvim", event = "BufRead" },
  { "mg979/vim-visual-multi", event = "BufRead" },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    config = function()
      require("nvim-surround").setup()
    end,
  },
}

local opts = {
  checker = {
    enabled = true,
    concurrency = 1,
  },
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      import = "",
      keys = "",
      lazy = "󰒲",
      loaded = "",
      not_loaded = "󰍕",
      plugin = "",
      runtime = "",
      source = "",
      start = "",
      task = "✔ ",
      list = {
        "󰝥",
        "➜",
        "★",
        "‒",
      },
    },
  },
}

require("lazy").setup(plugins, opts)
