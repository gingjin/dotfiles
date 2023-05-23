return {
  {
    "lervag/vimtex",
    config = function()
      require("G").map({
        { "n", "<leader>lw", ":VimtexCountWords<CR>", "Count words" },
        { "n", "<leader>lr", ":call vimtex#toc#refresh()", "Refresh toc" },
      })
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_view_general_viewer = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.vimtex_quickfix_open_on_warning = 0
      vim.g.vimtex_texcount_custom_arg = " -ch -total"
      vim.g.vimtex_compiler_method = "latexmk"
      vim.g.vimtex_compiler_progname = "nvr"
      vim.g.vimtex_toc_config = {
        name = "ToC",
        mode = 1,
        fold_enable = 0,
        fold_level_start = -1,
        hide_line_numbers = 1,
        indent_levels = 0,
        layer_status = {
          content = 1,
          label = 1,
          todo = 1,
          include = 1,
        },
        resize = 1,
        refresh_always = 0,
        show_help = 0,
        show_numbers = 1,
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
