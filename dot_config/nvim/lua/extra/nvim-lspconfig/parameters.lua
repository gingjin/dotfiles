local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
}

M.on_attach = function(client, bufnr)
  local function bufmap(mode, lhs, rhs, desc)
    local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  -- lspconfig
  bufmap("n", "<leader>e", vim.diagnostic.open_float, "Open float diagnostic")
  bufmap("n", "gq", vim.diagnostic.setqflist, "Open setqflist")
  bufmap("n", "[e", vim.diagnostic.goto_prev, "Goto previous diagnostic")
  bufmap("n", "]e", vim.diagnostic.goto_next, "Goto next diagnostic")
  bufmap("n", "K", vim.lsp.buf.hover, "LSP hover")
  bufmap("n", "gn", vim.lsp.buf.rename, "LSP rename")
  -- bufmap("n", "gr", vim.lsp.buf.references, "LSP references")
  bufmap("n", "gd", vim.lsp.buf.definition, "LSP definition")
  bufmap("n", "gD", vim.lsp.buf.declaration, "LSP declaration")
  bufmap("n", "gs", vim.lsp.buf.signature_help, "LSP signature help")
  bufmap("n", "gI", vim.lsp.buf.implementation, "LSP implementation")
  bufmap("n", "gt", vim.lsp.buf.type_definition, "LSP type definition")
  bufmap({ "n", "x" }, "ga", vim.lsp.buf.code_action, "LSP code action")
  bufmap("n", "gF", function()
    local params = require("vim.lsp.util").make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, "LSP format")
  bufmap("i", "<C-k>", function()
    vim.lsp.buf.signature_help()
  end, "")

  -- Trouble
  bufmap("n", "gr", ":TroubleToggle lsp_references<CR>", "LSP references")
end

return M
