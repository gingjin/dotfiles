return {
  { "jghauser/mkdir.nvim" },
  { "h-hg/fcitx.nvim", event = "InsertCharPre" },
  { "mg979/vim-visual-multi", event = "BufRead" },
  {
    "stevearc/aerial.nvim",
    cmd = "AerialToggle",
    keys = {
      { "<leader>at", ":AerialToggle!<CR>", desc = "Toggle Aerial", silent = true },
    },
    opts = function()
      return {
        on_attach = function(bufnr)
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
    end,
  },
  {
    "skywind3000/asynctasks.vim",
    cmd = "AsyncTask",
    keys = {
      { "<F3>", ":AsyncTask file-build<CR>", desc = "AsyncTask file-build" },
      { "<F4>", ":AsyncTask file-run<CR>", desc = "AsyncTask file-run" },
      { "<F9>", ":AsyncTask project-init<CR>", desc = "AsyncTask project-init" },
      { "<F10>", ":AsyncTask project-build<CR>", desc = "AsyncTask project-build" },
      { "<F11>", ":AsyncTask project-run<CR>", desc = "AsyncTask project-run" },
    },
    init = function()
      local g = vim.g
      g.asyncrun_open = 10
      g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
      g.asynctasks_term_pos = "bottom"
      g.asynctasks_term_rows = 10
      g.asynctasks_term_focus = 1
      g.asynctasks_config_name = { ".tasks", ".git/tasks.ini", ".svn/tasks.ini" }
      g.asynctasks_extra_config = {
        os.getenv("HOME") .. "/.config/nvim/lua/extra/asynctasks/tasks.ini",
      }
    end,
    dependencies = { "skywind3000/asyncrun.vim" },
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = function()
      return {
        mapping = { "jk" },
        timeout = vim.o.timeoutlen,
        clear_empty_lines = true,
        keys = "<Esc>",
      }
    end,
  },
  {
    "uga-rosa/ccc.nvim",
    keys = {
      { "<leader>ct", ":CccHighlighterToggle<CR>", desc = "Toggle Highlight", silent = true },
      { "<leader>cp", ":CccPick<CR>", desc = "Pick", silent = true },
      { "<leader>cc", ":CccConvert<CR>", desc = "Convert", silent = true },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append("tab:⇝ ")
    end,
    opts = function()
      return {
        char = "▎", -- ▏
      }
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    keys = {
      { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "Toggle Preview", silent = true },
    },
    ft = { "markdown" },
    init = function()
      local g = vim.g
      g.mkdp_filetypes = { "markdown" }
      g.mkdp_auto_start = 0
      g.mkdp_auto_close = 1
      g.mkdp_refresh_slow = 1
      g.mkdp_page_title = "『${name}』"
    end,
    build = "cd app && npm install",
  },
  {
    "chentoast/marks.nvim",
    event = "BufRead",
    config = function()
      require("marks").setup({
        force_write_shada = true,
      })
    end,
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPre",
    config = function()
      require("nvim-lastplace").setup({
        lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
        lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
        lastplace_open_folds = true,
      })
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "InsertCharPre",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "kevinhwang91/rnvimr",
    cmd = "RnvimrToggle",
    keys = {
      { "<M-r>", ":RnvimrToggle<CR>", desc = "Rnvimr", silent = true },
    },
    init = function()
      local g = vim.g
      g.rnvimr_enable_ex = 0
      g.rnvimr_enable_picker = 1
      g.rnvimr_hide_gitignore = 1
      g.rnvimr_draw_border = 1
      g.rnvimr_border_attr = { fg = 14, bg = -1 }
      g.rnvimr_enable_bw = 1
      vim.cmd("highlight link RnvimrNormal CursorLine")

      local G = require("G")
      G.map({
        { "t", "<M-r>", "<C-\\><C-n>:RnvimrToggle<CR>" },
        { "t", "<M-i>", "<C-\\><C-n>:RnvimrResize<CR>" },
      })
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    keys = {
      { "<M-g>", ":lua _lazygit_toggle()<CR>", desc = "LazyGit", silent = true },
    },
    dependencies = {
      {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        keys = {
          { "<M-t>", ":ToggleTerm<CR>", desc = "ToggleTerm", silent = true },
        },
        opts = function()
          return {
            size = 10,
            open_mapping = [[<M-t>]],
            shade_terminals = false,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
            shell = vim.o.shell,
            direction = "float",
            float_opts = { border = "double" },
            highlights = {
              Normal = {
                guibg = "NONE",
                ctermbg = "NONE",
              },
            },
          }
        end,
        config = function(_, opts)
          require("toggleterm").setup(opts)

          function _G.set_terminal_keymaps()
            local term_opts = { buffer = 0 }
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
            vim.keymap.set("t", "<M-h>", [[<Cmd>wincmd h<CR>]], term_opts)
            vim.keymap.set("t", "<M-j>", [[<Cmd>wincmd j<CR>]], term_opts)
            vim.keymap.set("t", "<M-k>", [[<Cmd>wincmd k<CR>]], term_opts)
            vim.keymap.set("t", "<M-l>", [[<Cmd>wincmd l<CR>]], term_opts)
          end
          vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

          function _G._lazygit_toggle()
            lazygit:toggle()
          end
          vim.keymap.set("n", "<M-g>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })
        end,
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    keys = {
      { "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", desc = "Workspace Diagnostics", silent = true },
      { "<leader>xx", ":TroubleToggle<CR>", desc = "Toggle Trouble", silent = true },
    },
    opts = function()
      local G = require("G")
      return {
        signs = {
          error = G.signs.Error,
          warning = G.signs.Warn,
          hint = G.signs.Hint,
          information = G.signs.Info,
          other = G.signs.Other,
        },
        use_diagnostic_signs = true,
      }
    end,
    dependencies = {
      {
        "folke/todo-comments.nvim",
        keys = {
          { "<leader>xt", ":TroubleToggle todo<CR>", desc = "Todo Comments", silent = true },
        },
        init = function()
          vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
          end, { desc = "Next todo comment" })
          vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
          end, { desc = "Previous todo comment" })
        end,
        config = function()
          require("todo-comments").setup()
        end,
        dependencies = { "nvim-lua/plenary.nvim" },
      },
    },
  },
  {
    "voldikss/vim-translator",
    keys = {
      { "<leader>tv", "<Plug>Translate", mode = "n", desc = "on cmdline" },
      { "<leader>tv", "<Plug>TranslateV", mode = "v" },
      { "<leader>tw", "<Plug>TranslateW", mode = "n", desc = "on windown" },
      { "<leader>tw", "<Plug>TranslateWV", mode = "v" },
    },
    init = function()
      vim.g.translator_default_engines = { "bing", "haici" }
    end,
  },
}
