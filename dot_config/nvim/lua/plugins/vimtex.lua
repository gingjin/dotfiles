return {
  {
    "lervag/vimtex",
    config = function()
      local map = require("K").map
      map("n", "<leader>lw", "<Cmd>VimtexCountWords<CR>", "Count words")
      map("n", "<leader>lR", "<Cmd>call vimtex#toc#refresh()<CR>", "Refresh toc")
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_texcount_custom_arg = " -ch -total"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_progname = "nvr"
      vim.g.vimtex_format_enabled = true
      vim.g.vimtex_toc_config = {
        name = "ToC",
        mode = 1,
        fold_enable = 0,
        fold_level_start = -1,
        hide_line_numbers = 1,
        hotkeys_enabled = 0,
        hotkeys = "abcdegijklmnopuvxyz",
        hotkeys_leader = ";",
        indent_levels = 1,
        layer_status = {
          content = 1,
          label = 1,
          todo = 1,
          include = 1,
        },
        resize = 0,
        refresh_always = 0,
        show_help = 0,
        show_numbers = 0,
        split_pos = "vert leftabove",
        split_width = 25,
        tocdepth = 3,
        todo_sorted = 0,
      }
      vim.g.vimtex_compiler_latexmk_engines = {
        _ = "-xelatex",
        pdfdvi = "-pdfdvi",
        pdfps = "-pdfps",
        pdflatex = "-pdf",
        luatex = "-lualatex",
        lualatex = "-lualatex",
        xelatex = "-xelatex",
      }
    end,
  },
}
