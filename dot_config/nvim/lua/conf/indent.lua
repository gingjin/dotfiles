-- nvim indent-blankline
--
local cmd = vim.cmd
cmd("highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine")
cmd("highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine")
cmd("highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine")
cmd("highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine")
cmd("highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine")
cmd("highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine")

require("indent_blankline").setup({
  char = "⎸",
  show_current_context = false,
  show_current_context_start = false,
  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
  char_highlight_list = {
    "IndentBlanklineIndent1",
    "IndentBlanklineIndent2",
    "IndentBlanklineIndent3",
    "IndentBlanklineIndent4",
    "IndentBlanklineIndent5",
    "IndentBlanklineIndent6",
  },
})
