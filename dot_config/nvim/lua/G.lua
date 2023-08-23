local G = {}

G.signs = {
  Error = "",
  Warn = "",
  Info = "",
  Hint = "",
  Other = "",
}

G.icons = {
  branch = "",
  add = "",
  change = "",
  remove = "",
  file_modified = "",
  close = "",
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
  cyan = "#5a93aa",
  orange = "#ff8349",
  green = "#63cdcd",
}

function G.map(maps)
  for _, map in pairs(maps) do
    local mode = map[1]
    local lhs = map[2]
    local rhs = map[3]
    local opts = { noremap = true, silent = true, desc = map[4] }
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

return G
