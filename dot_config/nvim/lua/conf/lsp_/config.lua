-- nvim lspconfig
--
local on_attach = function(client, bufnr)
  local function bufmap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  require("keymaps").lsp(bufmap)

  require("aerial").on_attach(client, bufnr)
end

local handlers = {
  ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = { spacing = 2, prefix = "" },
  }),
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, lsp in ipairs(require("conf.lsp_.servers").servers()) do
  require("lspconfig")[lsp].setup({
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
