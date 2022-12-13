-- nvim packer
--
local packer = require("packer")
packer.init({
  auto_reload_compiled = true,
  git = { default_url_format = "git@github.com:%s" },
  profile = { enable = true, threshold = 1 },
  display = {
    open_fn = function() return require("packer.util").float() end,
    working_sym = "",
    error_sym = "",
    done_sym = "",
    removed_sym = "",
    moved_sym = "",
    header_sym = "━",
    prompt_border = "double",
  },
})

packer.startup(function(use)
  use({ "dstein64/vim-startuptime" })
  use({ "sainnhe/gruvbox-material" })

  use({ "nvim-lua/popup.nvim" })
  use({ "jghauser/mkdir.nvim" })
  use({ "nvim-lua/plenary.nvim" })

  use({ "kevinhwang91/rnvimr", config = [[require "conf.rnvimr.init"]] })
  use({ "rcarriga/nvim-notify", config = [[require "conf.notify.init"]] })
  use({ "p00f/clangd_extensions.nvim", config = [[require "conf.clangd.init"]] })
  use({ "kyazdani42/nvim-tree.lua", config = [[require "conf.nvim-tree.init"]] })
  use({ "nvim-lualine/lualine.nvim", config = [[require "conf.lualine_.init"]],
    requires = { "kyazdani42/nvim-web-devicons" } })
  use({ "L3MON4D3/LuaSnip", config = [[require "conf.snippets.init"]],
    requires = { "rafamadriz/friendly-snippets" } })
  use({ "mfussenegger/nvim-dap", config = [[require "conf.dap_.init"]],
    requires = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", }, })
  use({ "neovim/nvim-lspconfig", config = [[require "conf.lsp.init"]],
    requires = { "glepnir/lspsaga.nvim", "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" }, })

  use({
    "hrsh7th/nvim-cmp",
    config = [[require "conf.cmp_.init"]],
    requires = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "David-Kunz/cmp-npm",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
      { "doxnit/cmp-luasnip-choice", after = "nvim-cmp",
        config = function() require("cmp_luasnip_choice").setup({ auto_open = true, }) end,
      },
      { "nat-418/cmp-color-names.nvim", after = "nvim-cmp",
        config = function() require("cmp-color-names").setup() end,
      },
    },
  })
  use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = [[require "conf.pairs.init"]] })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = [[require "conf.treesitter.init"]],
    requires = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "m-demare/hlargs.nvim", after = "nvim-treesitter",
        config = function() require("hlargs").setup() require("hlargs").enable() end,
      },
    },
    run = function()
      local ts_update = require("nvim-treesitter.install").update()
      ts_update()
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    config = [[require "conf.telescope_.init"]],
    requires = {
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-node-modules.nvim",
      "tyru/open-browser.vim",
      "benfowler/telescope-luasnip.nvim",
      "dhruvmanila/telescope-bookmarks.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  use({ "h-hg/fcitx.nvim", event = "BufRead" })
  use({ "mg979/vim-visual-multi", event = "BufRead" })
  use({ "chentoast/marks.nvim", event = "BufRead", config = [[require "conf.marks.init"]] })
  use({ "mfussenegger/nvim-lint", event = "BufRead", config = [[require "conf.lint.init"]] })
  use({ "stevearc/aerial.nvim", event = "BufRead", config = [[require "conf.aerial.init"]] })
  use({ "folke/zen-mode.nvim", event = "BufRead", config = [[require "conf.zen-mode.init"]] })
  use({ "numToStr/Comment.nvim", event = "BufRead", config = [[require "conf.comment.init"]] })
  use({ "folke/todo-comments.nvim", event = "BufRead", config = [[require "conf.todo.init"]] })
  use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = [[require "conf.gitsigns.init"]] })
  use({ "voldikss/vim-translator", event = "BufRead", config = [[require "conf.translator.init"]] })
  use({ "akinsho/toggleterm.nvim", event = "BufRead", config = [[require "conf.toggleterm.init"]] })
  use({ "mhartington/formatter.nvim", event = "BufRead", config = [[require "conf.formatter.init"]] })
  use({ "norcalli/nvim-colorizer.lua", event = "BufRead", config = [[require "conf.colorizer.init"]] })
  use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = [[require "conf.escape.init"]] })
  use({ "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = [[require "conf.indent.init"]] })
  use({ "kylechui/nvim-surround", event = "BufRead", config = function() require("nvim-surround").setup() end })
  use({ "skywind3000/asynctasks.vim", event = "BufRead", config = [[require "conf.tasks.init"]],
    requires = { { "skywind3000/asyncrun.vim", event = "BufRead" } }, })

  use({ "mechatroner/rainbow_csv", ft = "csv" })
  use({ "lervag/vimtex", config = [[require "conf.vimtex.init"]], ft = "tex" })
  use({ "vuki656/package-info.nvim", config = [[require "conf.package-info.init"]],
    requires = { "MunifTanjim/nui.nvim" }, ft = "json", })
  use({ "iamcco/markdown-preview.nvim", config = [[require "conf.mkdp.init"]],
    run = "cd app && npm install", ft = { "markdown" },
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, })
end)

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local Packer = augroup("Packer", { clear = true })
cmd("BufWritePost", {
  group = Packer,
  pattern = "plugins.lua",
  command = "source <afile> | PackerCompile",
})

-- local ensure_packer = function()
--   local fn = vim.fn
--   local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
--   if fn.empty(fn.glob(install_path)) > 0 then
--     fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
--     vim.cmd [[packadd packer.nvim]]
--     return true
--   end
--   return false
-- end
-- local packer = require("packer")
-- packer.startup(function(use)
--   use({ "wbthomason/packer.nvim" })
--
--   if ensure_packer() then
--     require('packer').sync()
--   end
-- end)
