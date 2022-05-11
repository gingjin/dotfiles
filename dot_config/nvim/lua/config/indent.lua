-- nvim indent-blankline

vim.g.indent_blankline_char = "⎸"

require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = false,
	show_first_indent_level = true,
	show_trailing_blankline_indent = false,
	space_char_blankline = " ",
})
