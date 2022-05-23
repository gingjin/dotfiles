-- nvim lspsaga
--
require("lspsaga").init_lsp_saga({
	debug = false,
	use_saga_diagnostic_sign = true,
	error_sign = "",
	warn_sign = "",
	infor_sign = "",
	hint_sign = "",
	diagnostic_header_icon = " ",
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 40,
		virtual_text = true,
	},
	finder_definition_icon = "ﳗ ",
	finder_reference_icon = " ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "v",
		split = "x",
		quit = "q",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = { quit = "q", exec = "<CR>" },
	rename_action_keys = { quit = "<C-c>", exec = "<CR>" },
	definition_preview_icon = " ",
	border_style = "double",
	rename_prompt_prefix = "",
	rename_output_qflist = {
		enable = false,
		auto_open_qflist = true,
	},
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = true,
})

vim.cmd("highlight link LspSagaFinderSelection Search")

local cmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local lspsaga_filetypes = augroup("lspsaga_filetypes", { clear = true })
cmd("FileType", {
	group = lspsaga_filetypes,
	pattern = "LspsagaHover",
	command = "nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>",
})
