local on_attach = function(bufnr)
  local function bufmap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  local opts = { noremap = true, silent = true }
  bufmap("n", "]h", "&diff ? ']h' : ':Gitsigns next_hunk<CR>'", { expr = true })
  bufmap("n", "[h", "&diff ? '[h' : ':Gitsigns prev_hunk<CR>'", { expr = true })

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

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = function()
      return {
        on_attach = on_attach,
        signs = {
          add = { hl = "GitSignsAdd", text = "┃", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
          change = { hl = "GitSignsChange", text = "┃", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
          delete = { hl = "GitSignsDelete", text = "╻", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          topdelete = { hl = "GitSignsDelete", text = "╹", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
          changedelete = {
            hl = "GitSignsChange",
            text = "━",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          untracked = { hl = "GitSignsAdd", text = "⸾", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        },
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "eol",
          delay = 1000,
          ignore_whitespace = true,
        },
        current_line_blame_formatter_opts = { relative_time = false },
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil,
        max_file_length = 40000,
        preview_config = {
          border = "double",
          style = "minimal",
          relative = "cursor",
          row = 0,
          col = 1,
        },
        yadm = { enable = false },
      }
    end,
  },
}
