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
  bufmap("n", "[e", ":lua vim.diagnostic.goto_prev()<CR>", "Goto previous diagnostic")
  bufmap("n", "]e", ":lua vim.diagnostic.goto_next()<CR>", "Goto next diagnostic")
  bufmap("n", "K", ":lua vim.lsp.buf.hover()<CR>", "LSP hover")
  bufmap("n", "gn", ":lua vim.lsp.buf.rename()<CR>", "LSP rename")
  bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>", "LSP references")
  bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", "LSP definition")
  bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", "LSP declaration")
  bufmap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", "LSP signature help")
  bufmap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", "LSP implementation")
  bufmap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", "LSP type definition")
  bufmap({ "n", "x" }, "ga", ":lua vim.lsp.buf.code_action()<CR>", "LSP code action")
  bufmap("n", "gF", function()
    local util = require("vim.lsp.util")
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, "LSP format")
  bufmap("i", "<C-k>", function()
    vim.lsp.buf.signature_help()
  end, "")
end

return M
