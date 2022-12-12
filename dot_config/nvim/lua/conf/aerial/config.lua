require("aerial").setup({
  lazy_load = true,
  backends = { "treesitter", "lsp", "markdown", "man" },
  highlight_mode = "split_width",
  layout = {
    max_width = { 40, 0.2 },
    width = nil,
    min_width = 10,
    win_opts = {},
    default_direction = "prefer_right",
    placement = "window",
  },
  on_attach = function(bufnr)
    vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
    vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  end
})
vim.keymap.set("n", "<leader>at", ":AerialToggle!<CR>")
