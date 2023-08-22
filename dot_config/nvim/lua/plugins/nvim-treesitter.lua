return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufRead", "BufNewFile" },
    cmd = { "TSInstall", "TSModuleInfo" },
    build = function()
      require("nvim-treesitter.install").update()
    end,
    init = function()
      vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
        group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
        callback = function()
          vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
          vim.opt.foldmethod = "expr"
          vim.opt.foldlevel = 99
        end,
      })
    end,
    opts = {
      ensure_installed = "all",
      sync_install = false,
      ignore_install = {},
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
      indent = {
        enable = true,
        disable = { "python" },
      },
      autotag = { enable = true },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      textobjects = {
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
          ["@class.outer"] = "<c-v>",
        },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>sn"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>sp"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = { query = "@class.outer", desc = "Next class start" },
            ["]l"] = "@loop.*",
            ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
          goto_next = {
            ["]d"] = "@conditional.outer",
          },
          goto_previous = {
            ["[d"] = "@conditional.outer",
          },
        },
      },
    },
    config = function(_, opts)
      for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
        config.install_info.url =
          config.install_info.url:gsub("https://github.com/", "https://ghproxy.com/https://github.com/")
      end
      require("nvim-treesitter.configs").setup(opts)
    end,
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
  },
}
