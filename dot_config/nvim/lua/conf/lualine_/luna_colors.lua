local colors = {
  color13 = '#b8cc52',
  tab     = "#32302f",
  fg      = "#ffffff",
  r       = "#450000",
  v       = "#fe8019",
  c       = "#789f00",
  bg_a    = "#005252",
  bg_b    = "#003f3f",
  bg_c    = "#002b2b",
}
return {
  normal = {
    a = { bg = colors.bg_a, fg = colors.fg, gui = 'bold' },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.bg_c, fg = colors.fg }
  },
  insert = {
    a = { bg = colors.bg_a, fg = colors.fg, gui = 'bold' },
    b = { bg = colors.bg_b, fg = colors.fg },
    c = { bg = colors.r, fg = colors.fg }
  },
  visual = {
    a = { bg = colors.v, fg = colors.fg, gui = 'bold' },
    -- b = { bg = colors.bg_b, fg = colors.fg },
    -- c = { bg = colors.bg_c, fg = colors.fg }
  },
  replace = {
    a = { bg = colors.r, fg = colors.fg, gui = 'bold' },
    -- b = { bg = colors.bg_b, fg = colors.fg },
    -- c = { bg = colors.bg_c, fg = colors.fg }
  },
  command = {
    a = { bg = colors.c, fg = colors.fg, gui = 'bold' },
    -- b = { bg = colors.bg_b, fg = colors.fg },
    -- c = { bg = colors.bg_c, fg = colors.fg }
  },
  inactive = {
    a = { bg = colors.tab, fg = colors.fg, },
    -- b = { bg = colors.bg_a, fg = colors.fg, },
    -- c = { bg = colors.bg_a, fg = colors.fg, }
  }
}
