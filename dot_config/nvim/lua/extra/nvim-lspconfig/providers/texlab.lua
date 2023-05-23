local M = require("extra.nvim-lspconfig.parameters")
local on_attach = function(bufnr)
  local function bufmap(mode, lhs, rhs, desc)
    local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- lspconfig
  bufmap("n", "[e", ":lua vim.diagnostic.goto_prev()<CR>", "Goto previous diagnostic")
  bufmap("n", "]e", ":lua vim.diagnostic.goto_next()<CR>", "Goto next diagnostic")
end

require("lspconfig").texlab.setup({
  handlers = M.handlers,
  on_attach = on_attach,
  capabilities = M.capabilities,
  settings = {
    texlab = {
      auxDirectory = ".",
      bibtexFormatter = "texlab",
      chktex = {
        onEdit = false,
        onOpenAndSave = true,
      },
      diagnosticsDelay = 300,
      formatterLineLength = 80,
    },
  },
})
