require("nightfox").setup({
  options = {
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled",
    transparent = true,
    terminal_colors = true,
    dim_inactive = false,
    module_default = true,
    colorblind = {
      enable = false,
      simulate_only = false,
      severity = {
        protan = 0,
        deutan = 0,
        tritan = 0,
      },
    },
    styles = {
      comments = "italic",
      conditionals = "NONE",
      constants = "NONE",
      functions = "italic,bold",
      keywords = "bold",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "italic,bold",
      variables = "NONE",
    },
    inverse = {
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {},
  },
  palettes = {},
  specs = {},
  groups = {},
})

vim.cmd("colorscheme terafox")
