-- nvim-lsp-installer
--
require("nvim-lsp-installer").setup({
  ensure_installed = require("conf.lsp_.servers").servers(),
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "",
      server_pending = "",
      server_uninstalled = "",
    },
  },
})
