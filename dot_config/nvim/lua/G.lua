local G = {}

G.signs = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "ﴞ",
}

G.icons = {
  err = " ",
  warn = " ",
  info = " ",
  hint = "ﴞ ",
  branch = "",
  add = "",
  change = "",
  remove = "",
  file_modified = "",
  modifie = "  ",
  close = "  ",
}

G.colors = {
  text = "#587b7b",
  red = "#e85c51",
  yellow = "#fda47f",
  blue = "#73a3b7",
  green = "#7aa4a1",
  orange = "#ff8349",
  fg = "fg",
  bg = "#0f1c1e",
  skyblue = "skyblue",
  oceanblue = "oceanblue",
}

G.servers = {
  "asm_lsp",
  "bashls",
  "clangd",
  "cmake",
  "cssls",
  "dockerls",
  "eslint",
  "gopls",
  "html",
  "jsonls",
  "lemminx",
  "marksman",
  "pyright",
  "rust_analyzer",
  "lua_ls",
  "texlab",
  "tsserver",
  "vimls",
  "yamlls",
}

local opts = { noremap = true, silent = true }
function G.map(maps)
  for _, map in pairs(maps) do
    vim.api.nvim_set_keymap(map[1], map[2], map[3], opts)
  end
end

return G
