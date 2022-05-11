-- nvim autopairs

local npairs = require("nvim-autopairs")
npairs.setup({
	enable_check_bracket_line = true,
	fast_wrap = {
		map = "<A-i>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0,
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})

local Rule = require("nvim-autopairs.rule")
npairs.add_rule(Rule("$", "$", { "markdown" }))
