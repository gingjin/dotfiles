local G = require("G")
for type, icon in pairs(G.signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

require("mason").setup({
  ui = {
    icons = {
      package_pending = "",
      package_installed = "",
      package_uninstalled = "ﮊ",
    },
  },
})

require("mason-lspconfig").setup({
  ensure_installed = G.servers,
  automatic_installation = true,
})

require("lspconfig.ui.windows").default_options.border = "double"

vim.diagnostic.config({
  virtual_text = { spacing = 2, prefix = "▎" },
  float = { border = "double" },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "double" }),
  ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "double" }),
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local util = require("vim.lsp.util")
local on_attach = function(client, bufnr)
  vim.keymap.set("n", "<leader>i", function()
    local params = util.make_formatting_params({})
    client.request("textDocument/formatting", params, nil, bufnr)
  end, { buffer = bufnr })

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true }
  local function bufmap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  bufmap("n", "<leader>o", ":Lspsaga outline<CR>", opts)
  bufmap("n", "<leader>sl", ":Lspsaga show_line_diagnostics<CR>", opts)
  bufmap("n", "<leader>sc", ":Lspsaga show_cursor_diagnostics<CR>", opts)
  bufmap("n", "<leader>sq", ":lua vim.diagnostic.setloclist()<CR>", opts)
  bufmap("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  bufmap("n", "]e", ":Lspsaga diagnostic_jump_next<CR>", opts)
  bufmap("n", "K", ":Lspsaga hover_doc<CR>", opts)
  bufmap("n", "gn", ":Lspsaga rename<CR>", opts)
  bufmap("n", "gl", ":Lspsaga lsp_finder<CR>", opts)
  bufmap("n", "gc", ":Lspsaga code_action<CR>", opts)
  bufmap("v", "gc", ":Lspsaga code_action<CR>", opts)
  bufmap("n", "gp", ":Lspsaga peek_definition<CR>", opts)
  bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
end

for _, server in ipairs(G.servers) do
  if server ~= "lua_ls" then
    require("lspconfig")[server].setup({
      handlers = handlers,
      on_attach = on_attach,
      capabilities = capabilities,
    })
  else
    require("lspconfig")["lua_ls"].setup({
      handlers = handlers,
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })
  end
end
