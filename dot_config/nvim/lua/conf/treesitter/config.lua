-- nvim treesitter
--
require("nvim-treesitter.configs").setup({
  ensure_installed = "all",
  sync_install = false,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = { "latex" },
    additional_vim_regex_highlighting = {},
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
  indent = { enable = true, disable = { "python", } },
  autotag = { enable = true },
  rainbow = { enable = true, extended_mode = true, max_file_lines = nil, },
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
      typescript = { __default = "// %s", __multiline = "/* %s */", },
    },
  },
})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufAdd', 'BufNew', 'BufNewFile', 'BufWinEnter' }, {
  group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
  callback = function()
    vim.opt.foldmethod = 'expr'
    vim.opt.foldexpr   = 'nvim_treesitter#foldexpr()'
  end
})
