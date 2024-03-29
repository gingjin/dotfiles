local G = {}

G.signs = {
  Error = "E",
  Warn = "W",
  Info = "I",
  Hint = "H",
  Other = "",
}

G.cmp_kinds = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "󰚯",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "󰆐",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
}

G.colors = {
  fg1 = "#cbd9d8",
  fg2 = "#587b7b",
  bg1 = "#1d3337",
  bg2 = "#152528",
  bg3 = "#0f1c1e",
  red = "#e85c51",
  yellow = "#fda47f",
  blue = "#7aa4a1",
  green = "#63cdcd",
  cyan = "#5a93aa",
  orange = "#ff8349",
}

G.parsers = {
  "bash",
  "c",
  "cmake",
  "cpp",
  "diff",
  "html",
  "htmldjango",
  "ini",
  "javascript",
  "json",
  "json5",
  "lua",
  "luadoc",
  "make",
  "markdown",
  "python",
  "rust",
  "vim",
  "vimdoc",
  "yaml",
}

G.servers = {
  "bashls",
  "clangd",
  "cmake",
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

return G
