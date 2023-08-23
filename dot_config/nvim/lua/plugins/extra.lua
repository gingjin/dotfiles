return {
  { "h-hg/fcitx.nvim", event = "InsertCharPre" },
  { "jghauser/mkdir.nvim", event = "InsertCharPre" },
  { "mg979/vim-visual-multi", event = "BufRead" },
  {
    "stevearc/aerial.nvim",
    keys = { { "<M-a>", ":AerialToggle!<CR>", desc = "Aerial", silent = true } },
    opts = {
      on_attach = function(bufnr)
        vim.keymap.set("n", "{", ":AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", ":AerialNext<CR>", { buffer = bufnr })
      end,
    },
  },
  {
    "skywind3000/asynctasks.vim",
    cmd = { "AsyncTask", "AsyncTaskEdit", "AsyncTaskList", "AsyncTaskMacro", "AsyncRun", "AsyncStop" },
    keys = {
      { "<F3>", ":AsyncTask file-build<CR>", desc = "AsyncTask file-build" },
      { "<F4>", ":AsyncTask file-run<CR>", desc = "AsyncTask file-run" },
      { "<F9>", ":AsyncTask project-init<CR>", desc = "AsyncTask project-init" },
      { "<F10>", ":AsyncTask project-build<CR>", desc = "AsyncTask project-build" },
      { "<F11>", ":AsyncTask project-run<CR>", desc = "AsyncTask project-run" },
    },
    init = function()
      vim.g.asyncrun_open = 10
      vim.g.asyncrun_rootmarks = { ".git", ".svn", ".root", ".project", ".hg" }
      vim.g.asynctasks_term_pos = "bottom"
      vim.g.asynctasks_term_rows = 10
      vim.g.asynctasks_term_focus = 1
      vim.g.asynctasks_config_name = { "tasks.ini", ".git/tasks.ini", ".svn/tasks.ini" }
      vim.g.asynctasks_extra_config = {
        os.getenv("HOME") .. "/.config/nvim/lua/extra/asynctasks/tasks.ini",
      }
    end,
    dependencies = { "skywind3000/asyncrun.vim" },
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
      { "<leader>ct", ":CccHighlighterToggle<CR>", desc = "Highlight", silent = true },
      { "<leader>cp", ":CccPick<CR>", desc = "Pick", silent = true },
      { "<leader>cc", ":CccConvert<CR>", desc = "Convert", silent = true },
    },
  },
  {
    "numToStr/Comment.nvim",
    event = "BufRead",
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
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    keys = {
      { "<leader>Do", ":DiffviewOpen<CR>", desc = "Open", silent = true },
      { "<leader>Dc", ":DiffviewClose<CR>", desc = "Close", silent = true },
      { "<leader>Dt", ":DiffviewToggleFiles<CR>", desc = "Files", silent = true },
      { "<leader>Df", ":DiffviewFocusFiles<CR>", desc = "Focus files", silent = true },
      { "<leader>Dr", ":DiffviewRefresh<CR>", desc = "Refresh", silent = true },
      { "<leader>Dh", ":DiffviewfileHistory<CR>", desc = "History", silent = true },
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile" },
    init = function()
      vim.opt.list = true
      vim.opt.listchars:append("tab:⇝ ")
    end,
    opts = { char = "⎸" },
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "ToggleTerm",
    keys = { { "<M-g>", ":LazyGit<CR>", desc = "LazyGit", silent = true } },
    config = function()
      vim.g.lazygit_use_neovim_remote = 0
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })
      require("G").map({
        {
          "n",
          "<M-g>",
          function()
            lazygit:toggle()
          end,
        },
      })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    keys = { { "<leader>mp", ":MarkdownPreviewToggle<CR>", desc = "Preview", silent = true } },
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
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    cmd = { "MasonToolsInstall", "MasonToolsUpdate" },
    opts = {
      ensure_installed = {
        "debugpy",
        "cmakelint",
        "cpplint",
        "flake8",
        "clang-format",
        "latexindent",
        "rustfmt",
        "stylua",
        "yapf",
      },
    },
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
      require("extra.nvim-notify.lsp_status").lsp_status()
    end,
  },
  {
    "kylechui/nvim-surround",
    event = "BufRead",
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    cmd = "ToggleTerm",
    keys = { { "<M-t>", ":ToggleTerm<CR>", desc = "ToggleTerm", silent = true } },
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
        border = "double",
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
      { "<leader>xx", ":TroubleToggle<CR>", desc = "Trouble", silent = true },
      { "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", desc = "Workspace diagnostics", silent = true },
      { "<leader>xd", ":TroubleToggle document_diagnostics<CR>", desc = "Document diagnostics", silent = true },
      { "<leader>xq", ":TroubleToggle quickfix<CR>", desc = "Quickfix", silent = true },
      { "<leader>xl", ":TroubleToggle loclist<CR>", desc = "Loclist", silent = true },
    },
    opts = function()
      local G = require("G")
      return {
        padding = false,
        indent_lines = false,
        auto_close = true,
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
        keys = { { "<leader>xt", ":TroubleToggle todo<CR>", desc = "Todo comments", silent = true } },
        config = function()
          require("todo-comments").setup()
          vim.keymap.set("n", "]t", function()
            require("todo-comments").jump_next()
          end, { desc = "Next todo comment" })
          vim.keymap.set("n", "[t", function()
            require("todo-comments").jump_prev()
          end, { desc = "Previous todo comment" })
        end,
      },
    },
  },
  {
    "voldikss/vim-translator",
    keys = {
      { "<leader>tv", "<Plug>Translate", mode = "n", desc = "On cmdline" },
      { "<leader>tv", "<Plug>TranslateV", mode = "v" },
      { "<leader>tw", "<Plug>TranslateW", mode = "n", desc = "On windown" },
      { "<leader>tw", "<Plug>TranslateWV", mode = "v" },
    },
    init = function()
      vim.g.translator_default_engines = { "bing", "haici" }
    end,
  },
  {
    "folke/which-key.nvim",
    opts = { layout = { height = { min = 4, max = 10 } } },
    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      require("which-key").setup(opts)
      require("which-key").register({
        b = { name = "+Buffer" },
        c = { name = "+CCC" },
        d = { name = "+Dap" },
        D = { name = "+Diffview" },
        f = { name = "+Telescope" },
        l = { name = "+Lazy" },
        m = { name = "+MarkdownPreview" },
        t = { name = "+Traslate" },
        v = { name = "+Vimtex" },
        x = { name = "+Trouble" },
      }, { prefix = "<leader>" })
    end,
  },
}
