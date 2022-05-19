-- nvim lualine

local colors = {
	red = "#db4b4b",
	yellow = "#e0af68",
	blue = "#0db9d7",
	green = "#10B981",
	orange = "#FF6600",
}

local function buffer_not_empty()
	return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function lsp()
	local msg = "No Active LSP"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

require("lualine").setup({
	options = {
		icons_enabled = true,
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = {},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			{
				"filename",
				file_status = true,
				path = 0,
				shorting_target = 40,
				symbols = {
					modified = "[+]",
					readonly = "[]",
					unnamed = "[-]",
				},
				cond = buffer_not_empty,
			},
			{ "filesize", cond = buffer_not_empty },
		},
		lualine_c = {
			{
				"diagnostics",
				sources = { "nvim_lsp" },
				sections = { "error", "warn", "info", "hint" },
				symbols = {
					error = " ",
					warn = " ",
					info = " ",
					hint = " ",
				},
				diagnostics_color = {
					error = { fg = colors.red },
					warn = { fg = colors.yellow },
					info = { fg = colors.blue },
					hint = { fg = colors.green },
				},
				update_in_insert = false,
				always_visible = false,
			},
		},
		lualine_x = { "filetype" },
		lualine_y = {
			{ "encoding", fmt = string.upper },
			{ "fileformat", symbols = { unix = "LF", dos = "CRLF", mac = "CR" } },
		},
		lualine_z = { "%p%% %l:%c% " },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			{
				"buffers",
				cond = buffer_not_empty,
				show_filename_only = false,
				show_modified_status = true,
				mode = 0,
				filetype_names = {
					TelescopePrompt = "Telescope",
					packer = "Packer",
					toggleterm = "Toggleterm",
					aerial = "Aerial",
					lspinfo = "LspInfo",
				},
			},
		},
		lualine_b = {},
		lualine_c = {},
		lualine_x = { { lsp, icon = " LSP:" } },
		lualine_y = {
			{ "b:gitsigns_head", icon = { "", color = { fg = colors.orange } } },
			{
				"diff",
				colored = true,
				symbols = { added = " ", modified = " ", removed = " " },
				source = diff_source,
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.blue },
					removed = { fg = colors.red },
				},
			},
		},
		lualine_z = {},
	},
	extensions = {
		"nvim-tree",
		"toggleterm",
		"aerial",
		"nvim-tree",
		"quickfix",
	},
})
