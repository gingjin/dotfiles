-- nvim lspconfig
--
require("lspconfig.ui.windows").default_options.border = "double"
vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "", },
  float = { border = "double", },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local signs = { Error = "", Warn = "", Hint = "ﴞ", Info = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

local util = require("vim.lsp.util")
local on_attach = function(client, bufnr)
  vim.keymap.set("n", "<leader>i", function()
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })
  require("conf.lsp.keymaps").lsp(bufnr)
end

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = "double" }
  ),
  ["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = "double" }
  ),
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, server in ipairs(require("conf.lsp.servers").servers) do
  require("lspconfig")[server].setup({
    handlers = handlers,
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

require("lspconfig")["sqls"].setup({
  handlers = handlers,
  on_attach = function(client, bufnr)
    require('sqls').on_attach(client, bufnr)
    vim.keymap.set("n", "<leader>i", function()
      local params = util.make_formatting_params({})
      client.request("textDocument/formatting", params, nil, bufnr)
    end, { buffer = bufnr })
    require("conf.lsp.keymaps").lsp(bufnr)
  end,
  capabilities = capabilities,
})
