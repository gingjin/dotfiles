return {
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    cmd = "Gitsigns",
    opts = function()
      local on_attach = function(bufnr)
        local gs = require("gitsigns")
        local function bufmap(mode, lhs, rhs, desc)
          local opts = { buffer = bufnr, noremap = true, silent = true, desc = desc }
          vim.keymap.set(mode, lhs, rhs, opts)
        end

        bufmap("n", "]h", gs.next_hunk, "Next hunk")
        bufmap("n", "[h", gs.prev_hunk, "Previous hunk")
        bufmap({ "n", "x" }, "<leader>hs", gs.stage_hunk, "Stage hunk")
        bufmap({ "n", "x" }, "<leader>hr", gs.reset_hunk, "Reset hunk")
        bufmap("n", "<leader>hS", gs.stage_buffer, "Stage buffer")
        bufmap("n", "<leader>hu", gs.undo_stage_hunk, "Undo stage hunk")
        bufmap("n", "<leader>hR", gs.reset_buffer, "Reset buffer")
        bufmap("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
        bufmap("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, "Show full blame line")
        bufmap("n", "<leader>tb", gs.toggle_current_line_blame, "Toggle blame line")
        bufmap("n", "<leader>hd", gs.diffthis, "Diff this")
        bufmap("n", "<leader>hD", function()
          gs.diffthis("~")
        end, "Diff this ~")
        bufmap("n", "<leader>td", gs.toggle_deleted, "Toggle deleted")
        bufmap({ "o", "x" }, "ih", "<Cmd><C-U>Gitsigns select_hunk<CR>", "Select hunk")
      end

      return {
        on_attach = on_attach,
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        show_deleted = false,
        signcolumn = true,
        numhl = false,
        linehl = false,
        word_diff = false,
        watch_gitdir = { interval = 1000, follow_files = true },
        attach_to_untracked = true,
        current_line_blame = false,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = "overlay",
          delay = 800,
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
