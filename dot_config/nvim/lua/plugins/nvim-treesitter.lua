return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufRead",
    opts = function()
      return {
        ensure_installed = require("nvim-treesitter.parsers").available_parsers(),
        sync_install = false,
        ignore_install = { "help" },
        highlight = {
          enable = true,
          disable = { "latex" },
          additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
          },
        },
        autotag = { enable = true },
        indent = {
          enable = true,
          disable = { "python" },
        },
        rainbow = {
          enable = true,
          query = {
            "rainbow-parens",
            tsx = "rainbow-tags",
            vue = "rainbow-tags",
            html = "rainbow-tags",
            latex = "rainbow-blocks",
            javascript = "rainbow-parens-react",
          },
          strategy = require("ts-rainbow").strategy.global,
        },
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)

      vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
        group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
        callback = function()
          vim.opt.foldmethod = "expr"
          vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        end,
      })
    end,
    build = function()
      require("nvim-treesitter.install").update()
    end,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "HiPhish/nvim-ts-rainbow2",
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}
