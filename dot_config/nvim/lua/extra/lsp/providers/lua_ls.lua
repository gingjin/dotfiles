local M = require("extra.lsp.parameters")
require("lspconfig")["lua_ls"].setup({
  handlers = M.handlers,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
