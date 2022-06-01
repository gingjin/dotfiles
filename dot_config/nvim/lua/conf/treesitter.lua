-- nvim treesitter
--

-- use git
require("nvim-treesitter.install").prefer_git = true

-- use curl and proxy
-- require("nvim-treesitter.install").command_extra_args = {
--  curl = { "--proxy", "http://127.0.0.1:7890" },
-- }

require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "phpdoc" },
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
  indent = { enable = true },
  autotag = { enable = true },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      css = "// %s",
      javascript = {
        __default = "// %s",
        jsx_element = "{/* %s */}",
        jsx_fragment = "{/* %s */}",
        jsx_attribute = "// %s",
        comment = "// %s",
      },
      typescript = {
        __default = "// %s",
        __multiline = "/* %s */",
      },
    },
  },
})
