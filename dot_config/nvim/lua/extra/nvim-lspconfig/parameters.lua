local M = {}

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
}

M.on_attach = function(client, bufnr)
  vim.keymap.set("n", "<leader>i", function()
    local util = require("vim.lsp.util")
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr, desc = "Format at LSP" })

  local function bufmap(mode, lhs, rhs, desc)
    local opts = { noremap = true, silent = true, desc = desc }
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
  end

  -- lspconfig
  bufmap("n", "K", ":lua vim.lsp.buf.hover()<CR>", "LSP Hover")
  bufmap("n", "gn", ":lua vim.lsp.buf.rename()<CR>", "LSP Rename")
  -- bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>", "LSP References")
  -- bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", "LSP Definition")
  bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", "LSP Declaration")
  bufmap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", "LSP Signature Help")
  -- bufmap("n", "gI", ":lua vim.lsp.buf.implementation()<CR>", "LSP Implementation")
  -- bufmap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", "LSP Type Definition")
  bufmap("n", "ga", ":lua vim.lsp.buf.code_action()<CR>", "LSP Code Action")
  bufmap("x", "ga", ":lua vim.lsp.buf.code_action()<CR>", "LSP Code Action")

  -- bufmap("n", "gf", ":lua vim.diagnostic.open_float()<CR>", "Open Float")
  -- bufmap("n", "gq", ":lua vim.diagnostic.setloclist()<CR>", "Set Loclist")
  bufmap("n", "[d", ":lua vim.diagnostic.goto_prev()<CR>", "Goto Previous")
  bufmap("n", "]d", ":lua vim.diagnostic.goto_next()<CR>", "Goto Next")
  -- bufmap("n", "[E", ":lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.ERROR})<CR>", "Goto Previous Error")
  -- bufmap("n", "]E", ":lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.ERROR})<CR>", "Goto Next Error")
  -- bufmap("n", "[W", ":lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.WARN})<CR>", "Goto Previous Warn")
  -- bufmap("n", "]W", ":lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.WARN})<CR>", "Goto Next Warn")
  -- bufmap("n", "[I", ":lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.INFO})<CR>", "Goto Previous Info")
  -- bufmap("n", "]I", ":lua vim.diagnostic.goto_next({severity=vim.diagnostic.severity.INFO})<CR>", "Goto Next Info")
  -- bufmap("n", "[H", ":lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.HINT})<CR>", "Goto Previous Hint")
  -- bufmap("n", "]H", ":lua vim.diagnostic.goto_prev({severity=vim.diagnostic.severity.HINT})<CR>", "Goto Next Hint")

  -- trouble
  bufmap("n", "gr", ":TroubleToggle lsp_references<CR>", "LSP References")
  bufmap("n", "gd", ":TroubleToggle lsp_definitions<CR>", "LSP Definition")
  bufmap("n", "gI", ":TroubleToggle lsp_implementations<CR>", "LSP Implementation")
  bufmap("n", "gt", ":TroubleToggle lsp_type_definitions<CR>", "LSP Type Definition")
end

return M
