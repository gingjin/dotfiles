-- nvim telescope
--
local tele = require("telescope")
local action_layout = require("telescope.actions.layout")
tele.setup({
  defaults = {
    multi_icon = "",
    prompt_prefix = "  ",
    selection_caret = "ﰲ ",
    file_ignore_patterns = { "__pycache__", ".git" },
    layout_strategy = "center",
    layout_config = {
      center = {
        anchor = "S",
        height = 0.4,
        width = 0.6,
        preview_cutoff = 1,
        prompt_position = "bottom",
      },
    },
    mappings = {
      n = {
        ["<A-p>"] = action_layout.toggle_preview
      },
      i = {
        ["<C-u>"] = false,
        ["<A-p>"] = action_layout.toggle_preview
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    bookmarks = {
      selected_browser = "chrome",
      url_open_command = "open",
      url_open_plugin = "open_browser",
      full_path = true,
      firefox_profile_name = nil,
    },
    symbols = {
      sources = { "emoji", "kaomoji", "gitmoji", "latex", "math" },
    },
  },
})

tele.load_extension("fzf")
tele.load_extension("packer")
tele.load_extension("luasnip")
tele.load_extension("bookmarks")
