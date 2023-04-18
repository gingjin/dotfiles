return {
  {
    "mfussenegger/nvim-lint",
    event = "BufRead",
    config = function()
      require("lint").linters_by_ft = {
        cmake = { "cmakelint" },
        cpp = { "cpplint" },
        python = { "flake8" },
      }
      vim.cmd("au TextChanged * lua require('lint').try_lint()")
    end,
  },
}
