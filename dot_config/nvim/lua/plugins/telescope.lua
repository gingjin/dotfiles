return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader><space>", ":Telescope<CR>", desc = "Telescope", silent = true },
      { "<leader>fb", ":Telescope buffers<CR>", desc = "Find Buffers", silent = true },
      { "<leader>fc", ":Telescope commands<CR>", desc = "Find Commands", silent = true },
      { "<leader>ff", ":Telescope find_files<CR>", desc = "Find File", silent = true },
      { "<leader>fh", ":Telescope help_tags<CR>", desc = "Find Vim Help", silent = true },
      { "<leader>fk", ":Telescope keymaps<CR>", desc = "Find Keymaps", silent = true },
      { "<leader>fl", ":Telescope luasnip<CR>", desc = "Find Snippets", silent = true },
      { "<leader>fo", ":Telescope oldfiles<CR>", desc = "Find Recent File", silent = true },
      { "<leader>fs", ":Telescope symbols<CR>", desc = "Find Symbols", silent = true },
      { "<leader>fw", ":Telescope live_grep<CR>", desc = "Find Words", silent = true },
      { "<leader>fy", ":Telescope lazy<CR>", desc = "Find Plugin Files", silent = true },
    },
    opts = function()
      local action_layout = require("telescope.actions.layout")
      return {
        defaults = {
          initial_mode = "normal",
          multi_icon = "",
          prompt_prefix = " ",
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
              ["<M-p>"] = action_layout.toggle_preview,
            },
            i = {
              ["<C-u>"] = false,
              ["<M-p>"] = action_layout.toggle_preview,
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
      }
    end,
    config = function(_, opts)
      require("telescope").setup(opts)
      require("telescope").load_extension("fzf")
      require("telescope").load_extension("lazy")
      require("telescope").load_extension("luasnip")
    end,
    dependencies = {
      "tsakirist/telescope-lazy.nvim",
      "benfowler/telescope-luasnip.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
