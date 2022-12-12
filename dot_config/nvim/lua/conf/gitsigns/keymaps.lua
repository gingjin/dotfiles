local opts = { noremap = true, silent = true }
local M = {}
M.gitsigns = function(bufmap)
  bufmap("n", "]d", "&diff ? ']d' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
  bufmap("n", "[d", "&diff ? '[d' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

  bufmap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
  bufmap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
  bufmap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
  bufmap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
  bufmap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", opts)
  bufmap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
  bufmap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", opts)
  bufmap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
  bufmap("n", "<leader>hb", ':lua require"gitsigns".blame_line{full=true}<CR>', opts)
  bufmap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opts)
  bufmap("n", "<leader>hd", ":Gitsigns diffthis<CR>", opts)
  bufmap("n", "<leader>hD", ':lua require"gitsigns".diffthis("~")<CR>', opts)
  bufmap("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", opts)

  bufmap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
  bufmap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
end
return M
