return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    opts = function()
      local on_attach = function(bufnr)
        vim.keymap.set(
          "n",
          "]h",
          "&diff ? ']h' : ':Gitsigns next_hunk<CR>'",
          { expr = true, buffer = bufnr, noremap = true, silent = true, desc = "Next hunk" }
        )
        vim.keymap.set(
          "n",
          "[h",
          "&diff ? '[h' : ':Gitsigns prev_hunk<CR>'",
          { expr = true, buffer = bufnr, noremap = true, silent = true, desc = "Previous hunk" }
        )

        local function bufmap(mode, lhs, rhs, desc)
          local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap({ "n", "x" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", "Stage hunk")
        bufmap({ "n", "x" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", "Reset hunk")
        bufmap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", "Stage buffer")
        bufmap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", "Undo stage hunk")
        bufmap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", "Reset buffer")
        bufmap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", "Preview hunk")
        bufmap("n", "<leader>hb", ":lua require'gitsigns'.blame_line{full=true}<CR>", "Show full blame line")
        bufmap("n", "<leader>hd", ":Gitsigns diffthis<CR>", "Diff this")
        bufmap("n", "<leader>hD", ":lua require'gitsigns'.diffthis('~')<CR>", "Diff this ~")
        bufmap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "Select hunk")
      end

      return {
        on_attach = on_attach,
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "▎" },
          topdelete = { text = "▎" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        show_deleted = false,
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
