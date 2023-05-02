local M = require("extra.nvim-lspconfig.parameters")
require("lspconfig")["lua_ls"].setup({
  handlers = M.handlers,
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
