return {
  {
    "freddiehaddad/feline.nvim",
    opts = function()
      local G = require("G")

      local function getsize()
        return vim.fn.getfsize(vim.fn.expand("%:p")) > 0
      end

      local function hide()
        return vim.fn.getfsize(vim.fn.expand("%:p")) > 0 and vim.api.nvim_win_get_width(0) > 60
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
              bg = G.colors.bg1,
              style = "bold",
            }
          end,
          left_sep = { str = " ", hl = { bg = G.colors.bg1 } },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = {
            name = "file_info",
            opts = {
              file_modified_icon = G.icons.file_modified,
            },
          },
          enabled = getsize,
          hl = { fg = G.colors.fg1, bg = G.colors.bg1 },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "diagnostic_errors",
          icon = " " .. G.signs.Error .. " ",
          hl = { fg = G.colors.red, bg = G.colors.bg1 },
        },
        {
          provider = "diagnostic_warnings",
          icon = " " .. G.signs.Warn .. " ",
          hl = { fg = G.colors.yellow, bg = G.colors.bg1 },
        },
        {
          provider = "diagnostic_info",
          icon = " " .. G.signs.Info .. " ",
          hl = { fg = G.colors.blue, bg = G.colors.bg1 },
        },
        {
          provider = "diagnostic_hints",
          icon = " " .. G.signs.Hint .. " ",
          hl = { fg = G.colors.green, bg = G.colors.bg1 },
        },
      }

      components.active[2] = {
        {
          provider = "git_branch",
          icon = {
            str = G.icons.branch .. " ",
            hl = { fg = G.colors.yellow, bg = G.colors.bg1 },
          },
          hl = { fg = G.colors.fg1, bg = G.colors.bg1, style = "bold" },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "git_diff_added",
          icon = G.icons.add .. " ",
          hl = { fg = G.colors.green, bg = G.colors.bg1 },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "git_diff_changed",
          icon = G.icons.change .. " ",
          hl = { fg = G.colors.yellow, bg = G.colors.bg1 },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "git_diff_removed",
          icon = G.icons.remove .. " ",
          hl = { fg = G.colors.red, bg = G.colors.bg1 },
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
          hl = { fg = G.colors.fg1, bg = G.colors.bg1 },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "file_size",
          enabled = hide,
          hl = { fg = G.colors.fg1, bg = G.colors.bg1, style = "bold" },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "position",
          enabled = hide,
          hl = { fg = G.colors.fg1, bg = G.colors.bg1, style = "bold" },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
        {
          provider = "scroll_bar",
          enabled = hide,
          hl = { fg = G.colors.cyan, bg = G.colors.bg1 },
        },
      }

      components.inactive[1] = {
        {
          provider = {
            name = "file_info",
            opts = { file_modified_icon = G.icons.file_modified },
          },
          hl = { fg = G.colors.fg1, bg = G.colors.bg1 },
          left_sep = { str = " ", hl = { bg = G.colors.bg1 } },
          right_sep = { str = " ", hl = { bg = G.colors.bg1 } },
        },
      }

      return {
        components = components,
        disable = {
          filetypes = { "^aerial$" },
        },
        force_inactive = {
          filetypes = {
            "^Trouble$",
            "^dapui_console$",
            "^dapui_breakpoints$",
            "^dapui_scopes$",
            "^dapui_stacks$",
            "^dapui_watches$",
            "^dapui_repl$",
          },
          buftypes = {
            "^quickfix$",
            "^help$",
            "^terminal$",
          },
          bufnames = {},
        },
      }
    end,
  },
}
