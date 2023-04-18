local on_attach = function(bufnr)
  vim.keymap.set(
    "n",
    "]h",
    "&diff ? ']h' : ':Gitsigns next_hunk<CR>'",
    { expr = true, buffer = bufnr, noremap = true, silent = true, desc = "Next Hunk" }
  )
  vim.keymap.set(
    "n",
    "[h",
    "&diff ? '[h' : ':Gitsigns prev_hunk<CR>'",
    { expr = true, buffer = bufnr, noremap = true, silent = true, desc = "Previous Hunk" }
  )

  local function bufmap(mode, lhs, rhs, desc)
    local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
    vim.keymap.set(mode, lhs, rhs, opts)
  end

  bufmap({ "n", "x" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage Hunk")
  bufmap({ "n", "x" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset Hunk")
  bufmap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", "Stage Buffer")
  bufmap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", "Undo Stage Hunk")
  bufmap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", "Reset Buffer")
  bufmap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", "Preview Hunk")
  bufmap("n", "<leader>hb", ":lua require'gitsigns'.blame_line{full=true}<CR>", "Show Full Blame Line")
  bufmap("n", "<leader>hd", ":Gitsigns diffthis<CR>", "Diff This")
  bufmap("n", "<leader>hD", ":lua require'gitsigns'.diffthis('~')<CR>", "Diff This ~")
  bufmap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select Hunk")
end

return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    opts = function()
      return {
        on_attach = on_attach,
        signs = {
          add = {
            hl = "GitSignsAdd",
            text = "┃",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
          change = {
            hl = "GitSignsChange",
            text = "┃",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          delete = {
            hl = "GitSignsDelete",
            text = "╻",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          topdelete = {
            hl = "GitSignsDelete",
            text = "╹",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
          },
          changedelete = {
            hl = "GitSignsChange",
            text = "━",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
          },
          untracked = {
            hl = "GitSignsAdd",
            text = "⸾",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
          },
        },
        show_deleted = true,
        signcolumn = true,
        numhl = false,
        linehl = true,
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
