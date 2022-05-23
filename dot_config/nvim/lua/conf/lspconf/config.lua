-- nvim lspconfig
--
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

for _, lsp in ipairs(require("options").servers()) do
	-- if lsp == "sumneko_lua" then
	-- 	local runtime_path = vim.split(package.path, ";")
	-- 	table.insert(runtime_path, "nvim/lua/?/?.lua")
	-- 	table.insert(runtime_path, "nvim/init.lua")
	-- 	require("lspconfig").sumneko_lua.setup({
	-- 		handlers = handlers,
	-- 		on_attach = on_attach,
	-- 		capabilities = capabilities,
	-- 		settings = {
	-- 			Lua = {
	-- 				runtime = { version = "LuaJIT", path = runtime_path },
	-- 				diagnostics = { globals = { "vim" } },
	-- 				workspace = { library = vim.api.nvim_get_runtime_file("", true) },
	-- 				telemetry = { enable = false },
	-- 			},
	-- 		},
	-- 	})
	-- end
	require("lspconfig")[lsp].setup({
		handlers = handlers,
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
