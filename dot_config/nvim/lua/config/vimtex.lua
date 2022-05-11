-- vimtex

local g = vim.g
g.tex_flavor = "latex"
g.tex_conceal = "abdmg"
g.vimtex_quickfix_mode = 0
g.vimtex_quickfix_open_on_warning = 0
g.vimtex_view_method = "zathura"
g.vimtex_view_general_viewer = "zathura"
g.vimtex_compiler_method = "latexmk"
g.vimtex_texcount_custom_arg = " -ch -total"
g.matchup_override_vimtex = 1
g.matchup_matchparen_deferred = 1

-- % !TEX program = xelatex
g.vimtex_compiler_latexmk_engines = {
	_ = "-xelatex",
}

local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
map("n", "<leader>lw", [[:VimtexCountWords<cr>]], opts)
