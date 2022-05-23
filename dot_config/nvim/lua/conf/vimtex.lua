-- vimtex
--
vim.cmd("syntax enable")
local g = vim.g
g.tex_flavor = "latex"
g.vimtex_compiler_progname = "nvr"
g.vimtex_quickfix_mode = 0
g.vimtex_quickfix_open_on_warning = 0
g.vimtex_view_method = "zathura"
g.vimtex_view_general_viewer = "zathura"
g.vimtex_compiler_method = "latexmk"
-- g.vimtex_texcount_custom_arg = " -ch -total"
-- g.matchup_override_vimtex = 1
-- g.matchup_matchparen_deferred = 1
g.vimtex_toc_config = {
	["name"] = "ToC",
	["mode"] = 1,
	["fold_enable"] = 0,
	["fold_level_start"] = -1,
	["hide_line_numbers"] = 1,
	["hotkeys_enabled"] = 0,
	["hotkeys"] = "abcdegijklmnopuvxyz",
	["hotkeys_leader"] = " ",
	["indent_levels"] = 0,
	["layer_status"] = {
		content = 1,
		label = 1,
		todo = 1,
		include = 1,
	},
	["layer_keys"] = {
		content = "C",
		label = "L",
		todo = "T",
		include = "I",
	},
	["resize"] = 0,
	["refresh_always"] = 0,
	["show_help"] = 0,
	["show_numbers"] = 1,
	["split_pos"] = "vert leftabove",
	["split_width"] = 30,
	["tocdepth"] = 3,
	["todo_sorted"] = 0,
}

-- % !TEX program = xelatex
g.vimtex_compiler_latexmk_engines = {
	_ = "-xelatex",
}

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local vimtex_config = augroup("vimtex_config", { clear = true })
cmd("User", {
	group = vimtex_config,
	pattern = "VimtexEventQuit",
	command = "call vimtex#compiler#clean(0)",
})
local VimTeX = augroup("VimTeX", { clear = true })
cmd("BufWritePost", {
	group = VimTeX,
	pattern = "*.tex",
	command = "call vimtex#toc#refresh()",
})
