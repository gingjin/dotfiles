local M = {}
M.lsp = function(bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local opts = { noremap = true, silent = true, }
  local function bufmap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  bufmap("n", "<leader>o", ":Lspsaga outline<CR>", opts)
  bufmap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)
  -- bufmap("n", "[e", ":lua vim.diagnostic.goto_prev()<CR>", opt)
  -- bufmap("n", "]e", ":lua vim.diagnostic.goto_next()<CR>", opt)
  bufmap("n", "[e", ":Lspsaga diagnostic_jump_prev<CR>", opts)
  bufmap("n", "]e", ":Lspsaga diagnostic_jump_next<CR>", opts)
  -- bufmap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opt)
  bufmap("n", "<leader>ld", ":Lspsaga show_line_diagnostics<CR>", opts)
  bufmap("n", "<leader>cd", ":Lspsaga show_cursor_diagnostics<CR>", opts)

  bufmap("n", "gl", ":Lspsaga lsp_finder<CR>", opts)
  bufmap("n", "gp", ":Lspsaga peek_definition<CR>", opts)
  -- bufmap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opt)
  bufmap("n", "K", ":Lspsaga hover_doc<CR>", opts)
  bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap("n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap("n", "gh", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  -- bufmap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opt)
  bufmap("n", "<leader>rn", ":Lspsaga rename<CR>", opts)
  -- bufmap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
  -- bufmap("v", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opt)
  bufmap("n", "<leader>ca", ":Lspsaga code_action<CR>", opts)
  bufmap("v", "<leader>ca", ":Lspsaga code_action<CR>", opts)
end
return M
