local g = vim.g
g.tex_flavor = "latex"
g.vimtex_view_method = "zathura"
g.vimtex_view_general_viewer = "zathura"
g.vimtex_quickfix_mode = 0
g.vimtex_quickfix_open_on_warning = 0
g.vimtex_texcount_custom_arg = " -ch -total"
g.vimtex_compiler_method = "latexmk"
g.vimtex_compiler_progname = "nvr"
g.vimtex_toc_config = {
  name = "ToC",
  mode = 1,
  fold_enable = 0,
  fold_level_start = -1,
  hide_line_numbers = 1,
  hotkeys_enabled = 0,
  hotkeys = "abcdegijklmnopuvxyz",
  hotkeys_leader = " ",
  indent_levels = 0,
  layer_status = {
    content = 1,
    label = 1,
    todo = 1,
    include = 1,
  },
  layer_keys = {
    content = "C",
    label = "L",
    todo = "T",
    include = "I",
  },
  resize = 1,
  refresh_always = 1,
  show_help = 0,
  show_numbers = 1,
  split_pos = "vert leftabove",
  split_width = 30,
  tocdepth = 3,
  todo_sorted = 0,
}
g.vimtex_compiler_latexmk_engines = {
  _ = "-xelatex",
  pdflatex = "-pdf",
  dvipdfex = "-pdfdvi",
  lualatex = "-lualatex",
  xelatex = "-xelatex",
  ["context (pdftex)"] = "-pdf -pdflatex=texexec",
  ["context (luatex)"] = "-pdf -pdflatex=context",
  ["context (xetex)"] = "-pdf -pdflatex=''texexec --xtx''",
}

local G = require("G")
G.map({
  { "n", "<leader>lw", ":VimtexCountWords<CR>" },
})
