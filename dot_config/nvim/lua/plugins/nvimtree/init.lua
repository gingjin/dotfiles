local G = require("G")
G.map({
  { "n", "<A-e>", ":NvimTreeToggle<CR>" },
})

local function on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opt(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  api.config.mappings.default_on_attach(bufnr)
  vim.keymap.set("n", "d", api.fs.trash, opt("Trash"))
  vim.keymap.set("n", "D", api.fs.remove, opt("Delete"))
end

require("nvim-tree").setup({
  on_attach = on_attach,
  auto_reload_on_write = true,
  disable_netrw = true,
  hijack_cursor = true,
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  sort_by = "case_sensitive",
  root_dirs = {},
  prefer_startup_root = true,
  sync_root_with_cwd = true,
  reload_on_bufenter = true,
  update_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
    ignore_list = { "toggleterm", "rnvimr" },
  },
  view = {
    centralize_selection = true,
    cursorline = true,
    hide_root_folder = false,
    width = 30,
    side = "left",
    preserve_window_proportions = true,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    float = { enable = false },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = true,
    highlight_opened_files = "icon",
    root_folder_label = ":~:s?$?/..?",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        item = "│",
        bottom = "─",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      symlink_arrow = " ➛ ",
      padding = " ",
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
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = { error = "", warning = "", info = "", hint = "ﴞ" },
  },
  filters = { dotfiles = false, custom = {}, exclude = {} },
  git = { enable = true, ignore = true, timeout = 400 },
  actions = {
    use_system_clipboard = true,
    change_dir = { enable = true, global = true, restrict_above_cwd = false },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
  trash = { cmd = "gio trash", require_confirm = true },
  live_filter = { prefix = "[FILTER]: ", always_show_folders = true },
  log = {
    enable = false,
  },
})
