-- nvim cmp
--
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	sources = cmp.config.sources({
		{ name = "calc" },
		{ name = "path" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "nvim_lsp" },
		{ name = "treesitter" },
		{ name = "nvim_lsp_signature_help" },
	}),
	mapping = cmp.mapping.preset.insert(require("keymaps").cmp(cmp, luasnip)),
	formatting = {
		format = function(_, vim_item)
			vim_item.kind = ({
				Text = "",
				Method = "",
				Function = "",
				Constructor = "",
				Field = "",
				Variable = "",
				Class = "𝓒",
				Interface = "ﰮ",
				Module = "",
				Property = "",
				Unit = "",
				Value = "",
				Enum = "",
				Keyword = "",
				Snippet = "",
				Color = "",
				File = "",
				Reference = "",
				Folder = "",
				EnumMember = "",
				Constant = "",
				Struct = "𝓢",
				Event = "",
				Operator = "ﬦ",
				TypeParameter = "",
			})[vim_item.kind]
			return vim_item
		end,
	},
})

local sources = { "/", "?" }
for _, source in pairs(sources) do
	cmp.setup.cmdline(source, {
		mapping = cmp.mapping.preset.cmdline(),
		sources = cmp.config.sources({
			{ name = "nvim_lsp_document_symbol" },
			{ name = "buffer" },
		}),
	})
end

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "cmdline" },
		{ name = "path" },
		{ name = "buffer" },
	}),
})
