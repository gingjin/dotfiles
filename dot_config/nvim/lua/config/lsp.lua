-- nvim lspconfig
--
local servers = {
	"bashls",
	"clangd",
	"cssls",
	"gopls",
	"html",
	"intelephense",
	"jdtls",
	"jsonls",
	"julials",
	"lemminx",
	"ltex",
	"pyright",
	"r_language_server",
	"rust_analyzer",
	"serve_d",
	"sorbet",
	"sqlls",
	"sumneko_lua",
	"tsserver",
	"vimls",
	"vuels",
	"yamlls",
}

-- nvim-lsp-installer
require("nvim-lsp-installer").setup({
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
	},
})

local on_attach = function(_, bufnr)
	local function bufmap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	require("keymaps").lsp(bufmap)
end

local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = { spacing = 2, prefix = "" },
	}),
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(servers) do
	if server == "sumneko_lua" then
		local runtime_path = vim.split(package.path, ";")
		table.insert(runtime_path, "nvim/lua/?/?.lua")
		table.insert(runtime_path, "nvim/init.lua")
		require("lspconfig").sumneko_lua.setup({
			handlers = handlers,
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					runtime = { version = "LuaJIT", path = runtime_path },
					diagnostics = { globals = { "vim" } },
					workspace = { library = vim.api.nvim_get_runtime_file("", true) },
					telemetry = { enable = false },
				},
			},
		})
	end
	require("lspconfig")[server].setup({
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- nvim lspsaga
--
require("lspsaga").setup({
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
		virtual_text = false,
	},
	finder_definition_icon = "ﳗ ",
	finder_reference_icon = " ",
	max_preview_lines = 10,
	finder_action_keys = {
		open = "o",
		vsplit = "s",
		split = "i",
		quit = "q",
		scroll_down = "<C-d>",
		scroll_up = "<C-u>",
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
