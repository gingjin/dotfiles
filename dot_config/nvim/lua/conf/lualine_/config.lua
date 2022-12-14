-- nvim lualine
--
local func = require("conf.lualine_.func")
local luna = require("conf.lualine_.luna_colors")
local lsp_colors = { red = "#db4b4b", yellow = "#e0af68", blue = "#0db9d7", green = "#10B981", orange = "#FF6600", }
require("lualine").setup({
  options = {
    theme = luna,
    icons_enabled = true,
    section_separators = { left = "", right = "" },
    component_separators = { left = "", right = "" },
    disabled_filetypes = {},
    always_divide_middle = false,
  },
  sections = {
    lualine_a = { { "mode", } },
    lualine_b = {
      {
        "diagnostics",
        sources = { "nvim_lsp" },
        sections = { "error", "warn", "info", "hint" },
        symbols = { error = " ", warn = " ", info = " ", hint = "ﴞ " },
        diagnostics_color = {
          error = { fg = lsp_colors.red },
          warn = { fg = lsp_colors.yellow },
          info = { fg = lsp_colors.blue },
          hint = { fg = lsp_colors.green },
        },
        colored = true,
        update_in_insert = false,
        always_visible = false,
      },
    },
    lualine_c = {
      {
        "filetype",
        colored = true,
        icon_only = true,
        -- icon = { align = "right" },
        padding = { left = 1, right = 0 }
      },
      {
        "filename",
        file_status = true,
        path = 0,
        shorting_target = 40,
        symbols = { modified = "[+]", readonly = "[]", unnamed = "[-]" },
        cond = func.buffer_not_empty,
      },
    },
    lualine_x = {
      func.mi,
      { "filesize", cond = func.buffer_not_empty },
      -- { func.lsp, icon = "LSP:", cond = func.buffer_not_empty },
      -- { "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
    },
    lualine_y = {
      { "encoding", fmt = string.upper, cond = func.buffer_not_empty },
      { "b:gitsigns_head", icon = { "", color = { fg = lsp_colors.orange } } },
      {
        "diff",
        colored = true,
        symbols = { added = " ", modified = " ", removed = " " },
        source = func.diff_source,
        diff_color = {
          added = { fg = lsp_colors.green },
          modified = { fg = lsp_colors.blue },
          removed = { fg = lsp_colors.red },
        },
      },
    },
    lualine_z = {
      { "progress", padding = { left = 1, right = 0 } },
      { "location", },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {
    lualine_a = {
      {
        "buffers",
        show_filename_only = true,
        show_modified_status = false,
        hide_filename_extension = false,
        mode = 2,
        filetype_names = {
          mason = "Mason",
          packer = "Packer",
          lspinfo = "LspInfo",
          toggleterm = "Toggleterm",
          TelescopePrompt = "Telescope",
        },
        symbols = { alternate_file = "" },
      },
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  inactive_winbar = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  extensions = { "nvim-tree", "toggleterm", "quickfix", },
})
