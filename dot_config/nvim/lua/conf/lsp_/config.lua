-- nvim lspconfig
--
vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "",
  },
  float = {
    border = "double",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local on_attach = function(_, bufnr)
  local function bufmap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  require("keymaps").lsp(bufmap)
end

local handlers = {
  ["textDocument/hover"] =  vim.lsp.with(
    vim.lsp.handlers.hover, { border = "double" }
  ),
  ["textDocument/signatureHelp"] =  vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = "double" }
  ),
}

local capabilities = require("cmp_nvim_lsp").update_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

for _, lsp in ipairs(require("conf.lsp_.servers").servers) do
  require("lspconfig")[lsp].setup({
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end
