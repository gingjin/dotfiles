return {
  { "h-hg/fcitx.nvim", event = "InsertCharPre" },
  { "jghauser/mkdir.nvim", event = "InsertCharPre" },
  { "mg979/vim-visual-multi", event = { "BufRead", "BufNewFile" } },
  {
    "stevearc/aerial.nvim",
    keys = { { "<M-a>", "<Cmd>AerialToggle!<CR>", desc = "Aerial", silent = true } },
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<Cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<Cmd>AerialNext<CR>", { buffer = bufnr })
      end,
    },
  },
  {
    "skywind3000/asynctasks.vim",
    dependencies = { "skywind3000/asyncrun.vim" },
    cmd = { "AsyncTask", "AsyncTaskEdit", "AsyncTaskList", "AsyncTaskMacro", "AsyncRun", "AsyncStop" },
    keys = {
      { "<F3>", "<Cmd>AsyncTask file-build<CR>", desc = "AsyncTask file-build" },
      { "<F4>", "<Cmd>AsyncTask file-run<CR>", desc = "AsyncTask file-run" },
      { "<F9>", "<Cmd>AsyncTask project-init<CR>", desc = "AsyncTask project-init" },
      { "<F10>", "<Cmd>AsyncTask project-build<CR>", desc = "AsyncTask project-build" },
      { "<F11>", "<Cmd>AsyncTask project-run<CR>", desc = "AsyncTask project-run" },
    },
    init = function()
      vim.g.asyncrun_open = 10
      vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
      vim.g.asynctasks_term_pos = "bottom"
      vim.g.asynctasks_term_rows = 10
      vim.g.asynctasks_term_focus = 1
      vim.g.asynctasks_config_name = { "tasks.ini", ".git/tasks.ini", ".svn/tasks.ini" }
      vim.g.asynctasks_extra_config = {
        vim.fn.stdpath("config") .. "/lua/extra/asynctasks/tasks.ini",
      }
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "jk" },
      timeout = vim.o.timeoutlen,
      clear_empty_lines = true,
      keys = "<Esc>",
    },
  },
  {
    "uga-rosa/ccc.nvim",
    keys = {
      { "<leader>cc", "<Cmd>CccConvert<CR>", desc = "Convert", silent = true },
      { "<leader>cp", "<Cmd>CccPick<CR>", desc = "Pick", silent = true },
      { "<leader>ct", "<Cmd>CccHighlighterToggle<CR>", desc = "Highlight", silent = true },
    },
    opts = {
      highlighter = { auto_enable = true, lsp = true },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        opts = { enable_autocmd = false },
      },
    },
    opts = function()
      return {
        padding = true,
        sticky = true,
        ignore = "^$",
        toggler = { line = "gcc", block = "gbc" },
        opleader = { line = "gc", block = "gb" },
        extra = { above = "gcO", below = "gco", eol = "gcA" },
        mappings = { basic = true, extra = true, extended = true },
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
        post_hook = nil,
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append("tab:⇝ ")
    end,
    opts = {
      indent = { char = "⎸" },
      scope = { enabled = false },
    },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    keys = {
      {
        "<M-g>",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
          lazygit:toggle()
        end,
        desc = "LazyGit",
        silent = true,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    keys = { { "<leader>pm", "<Cmd>MarkdownPreviewToggle<CR>", desc = "Preview", silent = true } },
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 1
      vim.g.mkdp_page_title = "『${name}』"
    end,
  },
  {
    "chentoast/marks.nvim",
    event = "BufRead",
    opts = { force_write_shada = true },
  },
  {
    "nacro90/numb.nvim",
    event = "BufRead",
    opts = {
      show_numbers = true,
      show_cursorline = true,
      hide_relativenumbers = true,
      number_only = false,
      centered_peeking = true,
    },
  },
  {
    "ethanholz/nvim-lastplace",
    event = "BufReadPre",
    opts = {
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    },
  },
  {
    "mfussenegger/nvim-lint",
    event = "BufRead",
    config = function()
      require("lint").linters_by_ft = {
        cmake = { "cmakelint" },
        cpp = { "cpplint" },
        python = { "flake8" },
      }
      vim.cmd("au TextChanged * lua require('lint').try_lint()")
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#000000",
      top_down = false,
      timeout = 2000,
      minimum_width = 40,
      stages = "slide",
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify")
      -- require("extra.nvim-notify.lsp_status").lsp_status()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    name = "window-picker",
    keys = {
      {
        "<leader>w",
        function()
          local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
          vim.api.nvim_set_current_win(picked_window_id)
        end,
        desc = "Pick a window",
      },
    },
  },
  {
    "kylechui/nvim-surround",
    event = { "BufRead", "BufNewFile" },
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "abecodes/tabout.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = {
      tabkey = "<Tab>",
      backwards_tabkey = "<S-Tab>",
      act_as_tab = true,
      act_as_shift_tab = true,
      default_tab = "<C-t>",
      default_shift_tab = "<C-d>",
      enable_backwards = true,
      completion = true,
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },
      ignore_beginning = true,
      exclude = {},
    },
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = { { "<M-t>", "<Cmd>ToggleTerm<CR>", desc = "ToggleTerm", silent = true } },
    init = function()
      function _G.set_terminal_keymaps()
        local term_opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], term_opts)
        vim.keymap.set("t", "<M-h>", [[<Cmd>wincmd h<CR>]], term_opts)
        vim.keymap.set("t", "<M-j>", [[<Cmd>wincmd j<CR>]], term_opts)
        vim.keymap.set("t", "<M-k>", [[<Cmd>wincmd k<CR>]], term_opts)
        vim.keymap.set("t", "<M-l>", [[<Cmd>wincmd l<CR>]], term_opts)
      end
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
    end,
    opts = {
      open_mapping = [[<M-t>]],
      shade_terminals = false,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      shell = vim.o.shell,
      direction = "float",
      float_opts = {
        border = "rounded",
        width = 110,
      },
      highlights = {
        Normal = {
          guibg = "NONE",
          ctermbg = "NONE",
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    keys = {
      { "<leader>xx", "<Cmd>TroubleToggle<CR>", desc = "Trouble", silent = true },
      { "<leader>xw", "<Cmd>TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics", silent = true },
      { "<leader>xd", "<Cmd>TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics", silent = true },
      { "<leader>xq", "<Cmd>TroubleToggle quickfix<CR>", desc = "Quickfix", silent = true },
      { "<leader>xl", "<Cmd>TroubleToggle loclist<CR>", desc = "Loclist", silent = true },
    },
    opts = function()
      local signs = require("G").signs
      return {
        padding = false,
        indent_lines = false,
        auto_close = true,
        signs = {
          error = signs.Error,
          warning = signs.Warn,
          hint = signs.Hint,
          information = signs.Info,
          other = signs.Other,
        },
        use_diagnostic_signs = true,
      }
    end,
    dependencies = {
      {
        "folke/todo-comments.nvim",
        keys = {
          { "<leader>xt", "<Cmd>TroubleToggle todo<CR>", desc = "Todo comments", silent = true },
          {
            "]t",
            function()
              require("todo-comments").jump_next()
            end,
            desc = "Next todo comment",
            silent = true,
          },
          {
            "[t",
            function()
              require("todo-comments").jump_prev()
            end,
            desc = "Previous todo comment",
            silent = true,
          },
        },
        config = true,
      },
    },
  },
  {
    "voldikss/vim-translator",
    keys = {
      { "<leader>tv", "<Plug>Translate", mode = "n", desc = "On cmdline" },
      { "<leader>tv", "<Plug>TranslateV", mode = "v", desc = "On cmdline" },
      { "<leader>tw", "<Plug>TranslateW", mode = "n", desc = "On windown" },
      { "<leader>tw", "<Plug>TranslateWV", mode = "v", desc = "On windown" },
    },
    init = function()
      vim.g.translator_default_engines = { "bing", "haici" }
    end,
  },
  {
    "folke/zen-mode.nvim",
    keys = { { "<F12>", ":ZenMode<CR>", desc = "Zen mode", silent = true } },
    opts = {
      window = {
        backdrop = 0.95,
        width = 100,
        height = 1,
        options = {
          signcolumn = "no",
          number = true,
          relativenumber = true,
          cursorline = false,
          cursorcolumn = false,
          foldcolumn = "0",
          list = false,
        },
      },
      plugins = {
        options = { enabled = true, ruler = false, showcmd = false },
        twilight = { enabled = false },
        gitsigns = { enabled = false },
        tmux = { enabled = false },
        kitty = { enabled = false, font = "+4" },
        alacritty = { enabled = false, font = "14" },
        wezterm = { enabled = false, font = "+4" },
      },
    },
  },
}
