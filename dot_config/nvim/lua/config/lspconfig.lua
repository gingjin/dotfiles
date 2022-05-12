-- nvim lspconfig

local lsp = vim.lsp
local handlers = {
	["textDocument/publishDiagnostics"] = lsp.with(lsp.diagnostic.on_publish_diagnostics, {
		underline = true,
		virtual_text = { spacing = 2, prefix = "" },
	}),
}

local on_attach = function(client, bufnr)
	-- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local map = vim.api.nvim_buf_set_keymap
	local opts = { noremap = true, silent = true }

	map(bufnr, "n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
	-- map("n", "[e", ":lua vim.diagnostic.goto_prev()<CR>", opts)
	-- map("n", "]e", ":lua vim.diagnostic.goto_next()<CR>", opts)
	-- map("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
	-- bufmap(bufnr, "n", "<leader>gd", ":lua vim.lsp.buf.definition()<CR>", opts)
	-- bufmap(bufnr, "n", "<leader>gr", ":lua vim.lsp.buf.references()<CR>", opts)
	-- bufmap(bufnr, "n", "<leader>D", ":lua vim.lsp.buf.type_definition()<CR>", opts)
	-- bufmap(bufnr, "n", "K", ":Lspsaga hover_doc<cr>", opts)
	-- bufmap(bufnr, "n", "<C-k>", ":lua vim.lsp.buf.signature_help()<CR>", opts)
	-- bufmap(bufnr, "n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
	-- bufmap(bufnr, "n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
	map(bufnr, "n", "<leader>gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
	map(bufnr, "n", "gi", ":lua vim.lsp.buf.implementation()<CR>", opts)
	map(bufnr, "n", "<leader>wa", ":lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	map(bufnr, "n", "<leader>wr", ":lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	map(bufnr, "n", "<leader>wl", ":lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	--
	--
	map(bufnr, "n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", opts)
	map(bufnr, "n", "]e", ":Lspsaga diagnostic_jump_next<CR>", opts)
	map(bufnr, "n", "<leader>ld", ":Lspsaga show_line_diagnostics<CR>", opts)
	map(bufnr, "n", "K", ":Lspsaga hover_doc<CR>", opts)
	map(bufnr, "n", "<C-k>", ":Lspsaga signature_help<CR>", opts)
	map(bufnr, "n", "<C-d>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", opts)
	map(bufnr, "n", "<C-u>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", opts)
	map(bufnr, "n", "<leader>rn", ":Lspsaga rename<CR>", opts)
	map(bufnr, "n", "<leader>pd", ":Lspsaga preview_definition<CR>", opts)
	map(bufnr, "n", "<leader>lf", ":Lspsaga lsp_finder<CR>", opts)
	map(bufnr, "n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
	map(bufnr, "x", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", opts)
end

local servers = {
	"sorbet",
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
	"solargraph",
	"sumneko_lua",
	"sqlls",
	"tsserver",
	"vimls",
	"vuels",
	"yamlls",
}

require("nvim-lsp-installer").setup({
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
	},
})

local capabilities = lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
for _, server in ipairs(servers) do
	require("lspconfig")[server].setup({
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end

-- nvim lspsaga

local lspsaga = require("lspsaga")
lspsaga.init_lsp_saga({
	debug = false,
	use_saga_diagnostic_sign = true,
	error_sign = "",
	warn_sign = "",
	infor_sign = "",
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
	server_filetype_map = {},
	diagnostic_prefix_format = "%d. ",
	diagnostic_message_format = "%m %c",
	highlight_prefix = true,
})

local cmd = vim.api.nvim_command
cmd("highlight link LspSagaFinderSelection Search")

-- nvim lspkind

require("lspkind").init({
	mode = "symbol",
	preset = "default",
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Class = "𝓒",
		Interface = "ﰮ",
		Module = "",
		Property = "",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "𝓢",
		Event = "",
		Operator = "",
		TypeParameter = "𝙏",
	},
})
