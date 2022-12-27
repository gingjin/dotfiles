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

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "sainnhe/gruvbox-material" })

  use({ "jghauser/mkdir.nvim" })
  use({ "nvim-lua/popup.nvim" })
  use({ "nvim-lua/plenary.nvim" })

  use({ "kevinhwang91/rnvimr", config = function() require("conf.rnvimr.init") end })
  use({ "rcarriga/nvim-notify", config = function() require("conf.notify_.init") end })
  use({ "kyazdani42/nvim-tree.lua", config = function() require("conf.nvim-tree_.init") end })
  use({ "L3MON4D3/LuaSnip", config = function() require("conf.snippets.init") end,
    requires = { "rafamadriz/friendly-snippets" } })
  use({ "nvim-lualine/lualine.nvim", config = function() require("conf.lualine_.init") end,
    requires = { "kyazdani42/nvim-web-devicons" } })

  use({
    "neovim/nvim-lspconfig",
    config = function() require("conf.lsp.init") end,
    requires = {
      "glepnir/lspsaga.nvim",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "ray-x/lsp_signature.nvim"
    },
  })

  use({
    "hrsh7th/nvim-cmp",
    config = function() require("conf.cmp_.init") end,
    requires = {
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "uga-rosa/cmp-dictionary",
      "saadparwaiz1/cmp_luasnip",
      "lukas-reineke/cmp-under-comparator",
      { "windwp/nvim-autopairs", config = function() require("conf.pairs.init") end },
    },
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    config = function() require("conf.treesitter.init") end,
    requires = {
      "p00f/nvim-ts-rainbow",
      "windwp/nvim-ts-autotag",
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
    config = function() require("conf.telescope_.init") end,
    requires = {
      "nvim-telescope/telescope-packer.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "benfowler/telescope-luasnip.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
    },
  })

  use({ "h-hg/fcitx.nvim", event = "BufRead" })
  use({ "mg979/vim-visual-multi", event = "BufRead" })
  use({ "chentoast/marks.nvim", event = "BufRead", config = function() require("conf.marks_.init") end })
  use({ "mfussenegger/nvim-lint", event = "BufRead", config = function() require("conf.lint_.init") end })
  use({ "folke/zen-mode.nvim", event = "BufRead", config = function() require("conf.zen-mode_.init") end })
  use({ "numToStr/Comment.nvim", event = "BufRead", config = function() require("conf.comment.init") end })
  use({ "folke/todo-comments.nvim", event = "BufRead", config = function() require("conf.todo.init") end })
  use({ "lewis6991/gitsigns.nvim", event = "BufRead", config = function() require("conf.gitsigns_.init") end })
  use({ "voldikss/vim-translator", event = "BufRead", config = function() require("conf.translator.init") end })
  use({ "akinsho/toggleterm.nvim", event = "BufRead", config = function() require("conf.toggleterm_.init") end })
  use({ "mhartington/formatter.nvim", event = "BufRead", config = function() require("conf.formatter_.init") end })
  use({ "norcalli/nvim-colorizer.lua", event = "BufRead", config = function() require("conf.colorizer_.init") end })
  use({ "max397574/better-escape.nvim", event = "InsertCharPre", config = function() require("conf.escape.init") end })
  use({ "lukas-reineke/indent-blankline.nvim", event = "BufRead", config = function() require("conf.indent.init") end })
  use({ "kylechui/nvim-surround", event = "BufRead", config = function() require("nvim-surround").setup() end })
  use({ "skywind3000/asynctasks.vim", event = "BufRead", config = function() require("conf.tasks.init") end,
    requires = { { "skywind3000/asyncrun.vim", event = "BufRead" } }, })
  use({ "mfussenegger/nvim-dap", config = function() require("conf.dap_.init") end, event = "BufRead",
    requires = { "rcarriga/nvim-dap-ui", "theHamsta/nvim-dap-virtual-text", } })

  use({ "mkitcc/nvim-cmake", ft = "txt" })
  use({ "mechatroner/rainbow_csv", ft = "csv" })
  use({ "lervag/vimtex", config = function() require("conf.vimtex.init") end, ft = "tex" })
  use({ "iamcco/markdown-preview.nvim", config = function() require("conf.mkdp.init") end,
    run = "cd app && npm install", ft = { "markdown" },
    setup = function() vim.g.mkdp_filetypes = { "markdown" } end, })

  if ensure_packer() then
    require("packer").sync()
  end
end)

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
