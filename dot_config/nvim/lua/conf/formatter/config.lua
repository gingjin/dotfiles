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
            "--style='{BasedOnStyle: Google, AlignConsecutiveAssignments: Consecutive}'",
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
