local G = require("G")

local getsize = function()
  return vim.fn.getfsize(vim.fn.expand("%:p")) > 0
end

local hide = function()
  return vim.fn.getfsize(vim.fn.expand("%:p")) > 0 and vim.api.nvim_win_get_width(0) > 60
end

local vi_mode_utils = require("feline.providers.vi_mode")

local components = {
  active = { {}, {}, {} },
  inactive = { {} },
}

components.active[1] = {
  {
    provider = "▊ ",
    hl = { fg = G.colors.oceanblue, bg = G.colors.bg },
  },
  {
    provider = "vi_mode",
    icon = "",
    hl = function()
      return {
        name = vi_mode_utils.get_mode_highlight_name(),
        fg = vi_mode_utils.get_mode_color(),
        bg = G.colors.bg,
        style = "bold",
      }
    end,
    right_sep = { str = " ", hl = { bg = G.colors.bg } },
  },
  {
    provider = {
      name = "file_info",
      opts = { file_modified_icon = G.icons.file_modified },
    },
    enabled = getsize,
    hl = { fg = G.colors.fg, bg = G.colors.bg },
    right_sep = { str = " ", hl = { bg = G.colors.bg } },
  },
  {
    provider = "git_branch",
    icon = {
      str = " " .. G.icons.branch .. " ",
      hl = { fg = G.colors.yellow, bg = G.colors.bg },
    },
    hl = { fg = G.colors.fg, bg = G.colors.bg },
  },
  {
    provider = "git_diff_added",
    icon = " " .. G.icons.add .. " ",
    hl = { fg = G.colors.green, bg = G.colors.bg },
  },
  {
    provider = "git_diff_changed",
    icon = " " .. G.icons.change .. " ",
    hl = { fg = G.colors.yellow, bg = G.colors.bg },
  },
  {
    provider = "git_diff_removed",
    icon = " " .. G.icons.remove .. " ",
    hl = { fg = G.colors.red, bg = G.colors.bg },
  },
}

components.active[2] = {}

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
    icon = " ",
    hl = { fg = G.colors.fg, bg = G.colors.bg },
  },
  {
    provider = "file_size",
    enabled = hide,
    hl = { fg = G.colors.fg, bg = G.colors.bg },
    right_sep = { str = " ", hl = { bg = G.colors.bg } },
  },
  {
    provider = "position",
    enabled = hide,
    hl = { fg = G.colors.fg, bg = G.colors.bg },
    right_sep = { str = " ", hl = { bg = G.colors.bg } },
  },
  {
    provider = "scroll_bar",
    enabled = hide,
    hl = { fg = G.colors.oceanblue, bg = G.colors.skyblue },
  },
}

components.inactive[1] = {
  {
    provider = {
      name = "file_info",
      opts = { file_modified_icon = G.icons.file_modified },
    },
    hl = { fg = G.colors.fg, bg = G.colors.bg },
    left_sep = { str = " ", hl = { bg = G.colors.bg } },
    right_sep = { str = " ", hl = { bg = G.colors.bg } },
  },
}

local force_inactive = {
  filetypes = {
    "^NvimTree$",
    "^lspsaga$",
  },
  buftypes = { "^qf$", "^help$", "^terminal$" },
  bufnames = {},
}

require("feline").setup({
  components = components,
  force_inactive = force_inactive,
})
