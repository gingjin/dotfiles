local G = require("G")
G.map({
  { "n", "<A-f>", ":Format<CR>" },
  { "n", "<A-F>", ":FormatWrite<CR>" },
})

local util = require("formatter.util")
require("formatter").setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    ["*"] = {
      require("formatter.filetypes.any").remove_trailing_whitespace,
    },
    cpp = {
      -- require("formatter.filetypes.cpp").clangformat,
      function()
        return {
          exe = "clang-format",
          args = {
            "-assume-filename",
            util.escape_path(util.get_current_buffer_file_name()),
            "--style='{BasedOnStyle: Google, AlignArrayOfStructures: Right, AlignConsecutiveAssignments: Consecutive, ContinuationIndentWidth: 2}'",
          },
          stdin = true,
        }
      end,
    },
    lua = {
      -- require("formatter.filetypes.lua").stylua,
      function()
        return {
          exe = "stylua",
          args = {
            "--line-endings Unix",
            "--indent-type Spaces",
            "--indent-width 2",
            "--search-parent-directories",
            "--stdin-filepath",
            util.escape_path(util.get_current_buffer_file_path()),
            "--",
            "-",
          },
          stdin = true,
        }
      end,
    },
    python = {
      require("formatter.filetypes.python").yapf,
    },
  },
})
