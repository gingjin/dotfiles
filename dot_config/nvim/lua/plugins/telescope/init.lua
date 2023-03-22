local G = require("G")
G.map({
  { "n", "<leader><space>", ":Telescope<CR>" },
  { "n", "<leader>fk", ":Telescope keymaps<CR>" },
  { "n", "<leader>fb", ":Telescope buffers<CR>" },
  { "n", "<leader>fc", ":Telescope commands<CR>" },
  { "n", "<leader>fo", ":Telescope oldfiles<CR>" },
  { "n", "<leader>fw", ":Telescope live_grep<CR>" },
  { "n", "<leader>fh", ":Telescope help_tags<CR>" },
  { "n", "<leader>ff", ":Telescope find_files<CR>" },
  { "n", "<leader>fs", ":Telescope spell_suggest<CR>" },
  { "n", "<leader>fp", ":Telescope lazy<CR>" },
  { "n", "<leader>fm", ":Telescope symbols<CR>" },
  { "n", "<leader>fl", ":Telescope luasnip<CR>" },
})

local action_layout = require("telescope.actions.layout")
require("telescope").setup({
  defaults = {
    initial_mode = "normal",
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
        ["<A-p>"] = action_layout.toggle_preview,
      },
      i = {
        ["<C-u>"] = false,
        ["<A-p>"] = action_layout.toggle_preview,
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
    symbols = {
      sources = { "emoji", "kaomoji", "gitmoji", "latex", "math" },
    },
    lazy = {
      show_icon = true,
      mappings = {
        open_in_browser = "<C-o>",
        open_in_find_files = "<C-f>",
        open_in_live_grep = "<C-g>",
        open_plugins_picker = "<C-b>",
        open_lazy_root_find_files = "<C-r>f",
        open_lazy_root_live_grep = "<C-r>g",
      },
    },
  },
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("lazy")
require("telescope").load_extension("luasnip")
