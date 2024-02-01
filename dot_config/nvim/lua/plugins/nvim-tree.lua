return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
      vim.cmd("highlight NvimTreeWindowPicker guifg=#ededed guibg=#44cc41")
      require("K").map("n", "<M-e>", "<Cmd>NvimTreeToggle<CR>", "NvimTree")
    end,
    opts = function()
      local function my_attach(bufnr)
        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
        vim.keymap.set("n", "D", api.fs.remove, opts("Delete"))
        vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("Close Directory"))
        vim.keymap.set("n", "l", api.node.open.edit, opts("Open"))
      end
      return {
        on_attach = my_attach,
        hijack_netrw = true,
        disable_netrw = true,
        auto_reload_on_write = true,
        hijack_unnamed_buffer_when_opening = true,
        hijack_cursor = false,
        root_dirs = {},
        prefer_startup_root = false,
        sync_root_with_cwd = true,
        reload_on_bufenter = true,
        respect_buf_cwd = true,
        hijack_directories = { enable = true, auto_open = true },
        update_focused_file = {
          enable = true,
          update_root = true,
          -- ignore_list = { "toggleterm" },
        },
        system_open = {
          cmd = "xdg-open",
          args = {},
        },
        modified = {
          enable = true,
          show_on_dirs = false,
          show_on_open_dirs = true,
        },
        filesystem_watchers = {
          enable = true,
          debounce_delay = 50,
          ignore_dirs = {},
        },
        select_prompts = false,
        view = {
          centralize_selection = true,
          cursorline = true,
          debounce_delay = 15,
          side = "left",
          preserve_window_proportions = true,
          number = false,
          relativenumber = false,
          signcolumn = "auto",
          width = 25,
          float = {
            enable = false,
            quit_on_focus_loss = true,
            open_win_config = {
              relative = "editor",
              border = "rounded",
              width = 30,
              height = 30,
              row = 1,
              col = 1,
            },
          },
        },
        renderer = {
          add_trailing = false,
          group_empty = false,
          full_name = false,
          highlight_git = true,
          highlight_opened_files = "name",
          highlight_modified = "none",
          root_folder_label = ":~:s?$?/..?",
          indent_width = 2,
          indent_markers = {
            enable = true,
            inline_arrows = true,
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
            git_placement = "before",
            modified_placement = "after",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
              file = true,
              folder = true,
              folder_arrow = false,
              git = true,
              modified = true,
            },
            glyphs = {
              default = "",
              symlink = "",
              bookmark = "󰆤",
              modified = "●",
              folder = {
                arrow_closed = "",
                arrow_open = "",
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
                unmerged = "",
                renamed = "➜",
                untracked = "★",
                deleted = "",
                ignored = "◌",
              },
            },
          },
          special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
          symlink_destination = true,
        },
        filters = {
          git_ignored = true,
          dotfiles = true,
          git_clean = false,
          no_buffer = false,
          custom = { "^.git$" },
          exclude = {},
        },
        trash = { cmd = "gio trash" },
        actions = {
          change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
          },
          expand_all = {
            max_folder_discovery = 300,
            exclude = { ".git", "target", "build" },
          },
          file_popup = {
            open_win_config = {
              col = 1,
              row = 1,
              relative = "cursor",
              border = "shadow",
              style = "minimal",
            },
          },
          open_file = {
            quit_on_open = true,
            eject = true,
            resize_window = true,
            window_picker = {
              enable = true,
              picker = "default",
              chars = "FJDKSLA;CMRUEIWOQP",
              exclude = {
                filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                buftype = { "nofile", "terminal", "help" },
              },
            },
          },
          remove_file = { close_window = true },
          use_system_clipboard = true,
        },
      }
    end,
  },
}
