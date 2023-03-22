require("nvim-autopairs").setup({
  disable_filetype = { "TelescopePrompt" },
  enable_check_bracket_line = false,
  fast_wrap = {
    map = "<A-i>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = [=[[%'%"%)%>%]%)%}%,]]=],
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "Search",
    highlight_grey = "Comment",
  },
})

local cmp = require("cmp")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

local Rule = require("nvim-autopairs.rule")
require("nvim-autopairs").add_rule(Rule("$", "$", { "markdown" }))
