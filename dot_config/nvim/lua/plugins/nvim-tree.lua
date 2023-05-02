return {
  {
    "kyazdani42/nvim-tree.lua",
    opts = function()
      local function on_attach(bufnr)
        local function opt(desc)
          return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true,
          }
        end
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "d", api.fs.trash, opt("Trash"))
        vim.keymap.set("n", "D", api.fs.remove, opt("Delete"))
      end

      return {
        on_attach = on_attach,
        auto_reload_on_write = true,
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        hijack_unnamed_buffer_when_opening = false,
        hijack_directories = {
          enable = true,
          auto_open = true,
        },
        sort_by = "case_sensitive",
        root_dirs = {},
        prefer_startup_root = true,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        diagnostics = { enable = false },
        update_focused_file = {
          enable = true,
          update_root = true,
          ignore_list = { "toggleterm", "rnvimr" },
        },
        view = {
          centralize_selection = true,
          cursorline = true,
          hide_root_folder = false,
          width = 25,
          side = "left",
          preserve_window_proportions = true,
          number = false,
          relativenumber = false,
          signcolumn = "yes",
          float = { enable = false },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          highlight_git = true,
          highlight_opened_files = "name",
          root_folder_label = function(path)
            return "../" .. vim.fn.fnamemodify(path, ":t")
          end,
          indent_markers = {
            enable = true,
            inline_arrows = false,
            icons = {
              corner = "└",
              edge = "│",
              item = "│",
              bottom = "─",
              none = " ",
            },
          },
          icons = {
            webdev_colors = true,
            -- git_placement = "before",
            git_placement = "signcolumn",
            symlink_arrow = " ➛ ",
            padding = " ",
            show = {
              file = true,
              folder = true,
              folder_arrow = false,
              git = true,
              modified = false,
            },
            glyphs = {
              default = "",
              symlink = "",
              modified = "",
              bookmark = "",
              folder = {
                arrow_open = "",
                arrow_closed = "",
                default = "",
                open = "",
                empty = "",
                empty_open = "",
                symlink = "",
                symlink_open = "",
              },
              git = {
                unstaged = "✗",
                staged = "✓",
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "ﱤ",
              },
            },
          },
        },
        trash = { cmd = "gio trash" },
        live_filter = {
          prefix = "[FILTER]: ",
          always_show_folders = false,
        },
        actions = {
          use_system_clipboard = true,
          change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
          },
          open_file = {
            quit_on_open = true,
            window_picker = {
              enable = true,
              chars = "FJDKSLA;CMRUEIWOQP",
              exclude = {
                filetype = { "notify", "lazy", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
        },
        log = { enable = false },
      }
    end,
    config = function(_, opts)
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.cmd("highlight NvimTreeWindowPicker guifg=#ededed guibg=#44cc41")
      require("G").map({ { "n", "<M-e>", ":NvimTreeToggle<CR>", "NvimTree" } })
      require("nvim-tree").setup(opts)
      local function open_nvim_tree(data)
        local directory = vim.fn.isdirectory(data.file) == 1
        if not directory then
          return
        end
        if directory then
          vim.cmd.cd(data.file)
        end
        require("nvim-tree.api").tree.open()
      end
      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "s1n7ax/nvim-window-picker",
        config = function()
          require("window-picker").setup()
          vim.keymap.set("n", "<leader>w", function()
            local picked_window_id = require("window-picker").pick_window() or vim.api.nvim_get_current_win()
            vim.api.nvim_set_current_win(picked_window_id)
          end, { desc = "Pick a window" })
        end,
      },
    },
  },
}
