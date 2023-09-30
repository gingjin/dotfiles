return {
  {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    keys = {
      { "<leader><Space>", "<Cmd>Telescope<CR>", desc = "Telescope", silent = true },
      { "<leader>fb", "<Cmd>Telescope buffers<CR>", desc = "Find buffers", silent = true },
      { "<leader>fc", "<Cmd>Telescope commands<CR>", desc = "Find commands", silent = true },
      { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "Find file", silent = true },
      { "<leader>fh", "<Cmd>Telescope help_tags<CR>", desc = "Find vim help", silent = true },
      { "<leader>fk", "<Cmd>Telescope keymaps<CR>", desc = "Find keymaps", silent = true },
      { "<leader>fl", "<Cmd>Telescope luasnip<CR>", desc = "Find snippets", silent = true },
      { "<leader>fo", "<Cmd>Telescope oldfiles<CR>", desc = "Find recent file", silent = true },
      { "<leader>fs", "<Cmd>Telescope symbols<CR>", desc = "Find symbols", silent = true },
      { "<leader>fw", "<Cmd>Telescope live_grep<CR>", desc = "Find words", silent = true },
      { "<leader>fy", "<Cmd>Telescope lazy<CR>", desc = "Find plugin files", silent = true },
      { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Find projects", silent = true },
    },
    opts = function()
      local action_layout = require("telescope.actions.layout")
      return {
        defaults = {
          preview = false,
          initial_mode = "normal",
          multi_icon = "",
          prompt_prefix = " ",
          selection_caret = "ﰲ ",
          file_ignore_patterns = { "^__pycache__$", "^.git$" },
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
      require("telescope").load_extension("projects")
    end,
    dependencies = {
      "tsakirist/telescope-lazy.nvim",
      "benfowler/telescope-luasnip.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
  },
}
