local o = vim.opt
o.list = true
o.listchars = { tab = "⇝ " }

vim.cmd([[highlight IndentBlanklineIndent guifg=#688b89 gui=nocombine]])

require("indent_blankline").setup({
  char = "▏",
  char_highlight_list = {
    "IndentBlanklineIndent",
  },
  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
})
