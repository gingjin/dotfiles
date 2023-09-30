return {
  {
    "freddiehaddad/feline.nvim",
    opts = function()
      local colors = require("G").colors
      local icons = require("G").icons
      local signs = require("G").signs

      local function getsize()
        return vim.fn.getfsize(vim.fn.expand("%:p")) > 0
      end

      local function hide()
        return getsize() and vim.api.nvim_win_get_width(0) > 60
      end

      local components = {
        active = { {}, {}, {} },
        inactive = { {} },
      }

      components.active[1] = {
        {
          provider = "vi_mode",
          icon = "",
          hl = function()
            local vi_mode_utils = require("feline.providers.vi_mode")
            return {
              name = vi_mode_utils.get_mode_highlight_name(),
              fg = vi_mode_utils.get_mode_color(),
              bg = colors.bg3,
              style = "bold",
            }
          end,
          left_sep = { str = " ", hl = { bg = colors.bg3 } },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = {
            name = "file_info",
            opts = {
              file_modified_icon = icons.file_modified,
            },
          },
          enabled = getsize,
          hl = { fg = colors.fg1, bg = colors.bg3 },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "diagnostic_errors",
          icon = " " .. signs.Error .. " ",
          hl = { fg = colors.red, bg = colors.bg3 },
        },
        {
          provider = "diagnostic_warnings",
          icon = " " .. signs.Warn .. " ",
          hl = { fg = colors.yellow, bg = colors.bg3 },
        },
        {
          provider = "diagnostic_info",
          icon = " " .. signs.Info .. " ",
          hl = { fg = colors.green, bg = colors.bg3 },
        },
        {
          provider = "diagnostic_hints",
          icon = " " .. signs.Hint .. " ",
          hl = { fg = colors.blue, bg = colors.bg3 },
        },
      }

      components.active[2] = {
        {
          provider = "git_branch",
          icon = {
            str = icons.branch .. " ",
            hl = { fg = colors.yellow, bg = colors.bg3 },
          },
          hl = { fg = colors.fg1, bg = colors.bg3, style = "bold" },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "git_diff_added",
          icon = icons.add .. " ",
          hl = { fg = colors.green, bg = colors.bg3 },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "git_diff_changed",
          icon = icons.change .. " ",
          hl = { fg = colors.yellow, bg = colors.bg3 },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "git_diff_removed",
          icon = icons.remove .. " ",
          hl = { fg = colors.red, bg = colors.bg3 },
        },
      }

      components.active[3] = {
        {
          provider = function()
            local name_with_path = os.getenv("VIRTUAL_ENV")
            local venv = {}
            for match in (name_with_path .. "/"):gmatch("(.-)" .. "/") do
              table.insert(venv, match)
            end
            return venv[#venv]
          end,
          enabled = function()
            return os.getenv("VIRTUAL_ENV") ~= nil
          end,
          icon = function()
            return require("nvim-web-devicons").get_icon(".py") .. " "
          end,
          hl = { fg = colors.fg1, bg = colors.bg3 },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "lsp_client_names",
          enabled = hide,
          icon = "",
          hl = { fg = colors.fg1, bg = colors.bg3, style = "bold" },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "file_size",
          enabled = hide,
          hl = { fg = colors.fg1, bg = colors.bg3, style = "bold" },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "position",
          enabled = hide,
          hl = { fg = colors.fg1, bg = colors.bg3, style = "bold" },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
        {
          provider = "scroll_bar",
          enabled = hide,
          hl = { fg = colors.cyan, bg = colors.bg3 },
        },
      }

      components.inactive[1] = {
        {
          provider = {
            name = "file_info",
            opts = { file_modified_icon = icons.file_modified },
          },
          icon = "",
          hl = { fg = colors.fg1, bg = colors.bg3 },
          left_sep = { str = " ", hl = { bg = colors.bg3 } },
          right_sep = { str = " ", hl = { bg = colors.bg3 } },
        },
      }

      return {
        components = components,
        disable = {
          filetypes = {
            "^aerial",
            "^NvimTree",
          },
        },
        force_inactive = {
          filetypes = {
            "^vimtex",
            "^Trouble$",
            "^dapui_console$",
            "^dapui_breakpoints$",
            "^dapui_scopes$",
            "^dapui_stacks$",
            "^dapui_watches$",
            "repl$",
          },
          buftypes = {
            "^quickfix",
            "^help",
            "^terminal",
          },
          bufnames = {},
        },
      }
    end,
  },
}
