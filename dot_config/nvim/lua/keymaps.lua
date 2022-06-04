local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- indent code
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- jump window
keymap("n", "<A-h>", "<C-w>h", opts)
keymap("n", "<A-j>", "<C-w>j", opts)
keymap("n", "<A-k>", "<C-w>k", opts)
keymap("n", "<A-l>", "<C-w>l", opts)

-- resize window
keymap("n", "<A-up>", "<C-w>10+", opts)
keymap("n", "<A-down>", "<C-w>10-", opts)
keymap("n", "<A-left>", "<C-w>10<", opts)
keymap("n", "<A-right>", "<C-w>10>", opts)

-- move the cursor in insert mode
keymap("i", "<A-h>", "<left>", opts)
keymap("i", "<A-j>", "<down>", opts)
keymap("i", "<A-k>", "<up>", opts)
keymap("i", "<A-l>", "<right>", opts)

-- quickly jump to the beginning and end of a line
keymap("n", "L", "$", opts)
keymap("n", "H", "^", opts)

-- select all
keymap("n", "<C-a>", "gg<S-v>G", opts)

-- save the file
keymap("n", "<C-s>", ":wa<CR>", opts)

-- save and close the file
keymap("n", "<C-q>", ":wq<CR>", opts)

-- dadbod
keymap("n", "<leader>dt", ":DBUIToggle<CR>", opts)

-- markdown-preview
keymap("n", "<leader>mp", "<Plug>MarkdownPreviewToggle", {})

-- translator
keymap('n', '<leader>tv', '<Plug>Translate', opts)
keymap('v', '<leader>tv', '<Plug>TranslateV', opts)
keymap('n', '<leader>tw', '<Plug>TranslateW', opts)
keymap('v', '<leader>tw', '<Plug>TranslateWV', opts)
keymap('n', '<leader>tr', '<Plug>TranslateR', opts)
keymap('v', '<leader>tr', '<Plug>TranslateRV', opts)
keymap('n', '<leader>tx', '<Plug>TranslateX', opts)

-- vimtex
keymap("n", "<leader>lw", ":VimtexCountWords<CR>", opts)

-- nvim aerial
keymap("n", "<leader>at", ":AerialToggle<CR>", opts)

-- nvim colorizer
keymap("n", "<leader>ct", ":ColorizerToggle<CR>", opts)

-- nvim dap
keymap("n", "<A-K>", ":lua require('dapui').eval()<CR>", opts)
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F7>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
keymap("n", "<leader>dr", ":lua require'dap'.repl.toggle()<CR>", opts)
keymap("n", "<leader>dl", ":lua require'dap'.run_last()<CR>", opts)

-- nvim lazygit
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)

-- nvim lualine
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<leader>bd", ":bdelete<CR>", opts)

-- nvim neoformat
keymap("n", "<leader>i", ":Neoformat<CR>", opts)

-- nvim package-info
keymap("n", "<leader>ns", ":lua require('package-info').show()<CR>", opts)
keymap("n", "<leader>nh", ":lua require('package-info').hide()<CR>", opts)
keymap("n", "<leader>nu", ":lua require('package-info').update()<CR>", opts)
keymap("n", "<leader>nd", ":lua require('package-info').delete()<CR>", opts)
keymap("n", "<leader>ni", ":lua require('package-info').install()<CR>", opts)
keymap("n", "<leader>nr", ":lua require('package-info').reinstall()<CR>", opts)
keymap("n", "<leader>np", ":lua require('package-info').change_version<CR>", opts)

-- nvim ranger
keymap("t", "<A-i>", "<C-\\><C-n>:RnvimrResize<CR>", opts)
keymap("n", "<A-r>", ":RnvimrToggle<CR>", opts)
keymap("t", "<A-r>", "<C-\\><C-n>:RnvimrToggle<CR>", opts)

-- nvim telescope
keymap("n", "<leader><space>", ":Telescope<CR>", opts)
keymap("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<CR>", opts)
keymap("n", "<leader>fo", ":Telescope oldfiles<CR>", opts)
keymap("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fa", ":Telescope aerial<CR>", opts)
keymap("n", "<leader>fp", ":Telescope packer<CR>", opts)
keymap("n", "<leader>fs", ":Telescope symbols<CR>", opts)
keymap("n", "<leader>fl", ":Telescope luasnip<CR>", opts)
keymap("n", "<leader>fm", ":Telescope bookmarks<CR>", opts)
keymap("n", "<leader>fn", ":Telescope node_modules list<CR>", opts)
keymap("n", "<leader>fdf", ":Telescope dap frames<CR>", opts)
keymap("n", "<leader>fdm", ":Telescope dap commands<CR>", opts)
keymap("n", "<leader>fdv", ":Telescope dap variables<CR>", opts)
keymap("n", "<leader>fdc", ":Telescope dap configurations<CR>", opts)
keymap("n", "<leader>fdl", ":Telescope dap list_breakpoints<CR>", opts)

-- nvim todo-comment
keymap("n", "<leader>tl", ":TodoLocList<CR>", opts)
keymap("n", "<leader>tq", ":TodoQuickFix<CR>", opts)
keymap("n", "<leader>tt", ":TodoTelescope<CR>", opts)

-- nvim toggleterm
function _G.set_terminal_keymaps()
  local map = vim.api.nvim_buf_set_keymap
  local opt = { noremap = true }
  map(0, "t", "<esc>", "<C-\\><C-n>", opt)
  map(0, "t", "<A-h>", "<C-\\><C-n><C-w>h", opt)
  map(0, "t", "<A-j>", "<C-\\><C-n><C-w>j", opt)
  map(0, "t", "<A-k>", "<C-\\><C-n><C-w>k", opt)
  map(0, "t", "<A-l>", "<C-\\><C-n><C-w>l", opt)
end
local cmd = vim.api.nvim_command
cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

-- nvim tree
keymap("n", "<A-e>", ":NvimTreeToggle<CR>", opts)

-- nvim zen-mode
keymap("n", "<F12>", ":ZenMode<CR>", opts)

local M = {}
-- nvim aerial
M.aerial = function(bufmap)
  bufmap("n", "<leader>at", ":AerialToggle!<CR>", {})
  bufmap("n", "{", ":AerialPrevUp<CR>", {})
  bufmap("n", "}", ":AerialNextUp<CR>", {})
  bufmap("n", "[[", ":AerialPrev<CR>", {})
  bufmap("n", "]]", ":AerialNext<CR>", {})
end

-- nvim cmp
M.cmp = function(cmp, luasnip)
  return {
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-c>"] = cmp.mapping.close(),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<Up>"] = cmp.mapping.select_prev_item(),
    ["<Down>"] = cmp.mapping.select_next_item(),
    ["<CR>"] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }
end

-- nvim gitsigns
M.gitsigns = function(bufmap)
  bufmap("n", "]d", "&diff ? ']d' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
  bufmap("n", "[d", "&diff ? '[d' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

  bufmap("n", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
  bufmap("v", "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)
  bufmap("n", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
  bufmap("v", "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)
  bufmap("n", "<leader>hS", ":Gitsigns stage_buffer<CR>", opts)
  bufmap("n", "<leader>hu", ":Gitsigns undo_stage_hunk<CR>", opts)
  bufmap("n", "<leader>hR", ":Gitsigns reset_buffer<CR>", opts)
  bufmap("n", "<leader>hp", ":Gitsigns preview_hunk<CR>", opts)
  bufmap("n", "<leader>hb", ':lua require"gitsigns".blame_line{full=true}<CR>', opts)
  bufmap("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opts)
  bufmap("n", "<leader>hd", ":Gitsigns diffthis<CR>", opts)
  bufmap("n", "<leader>hD", ':lua require"gitsigns".diffthis("~")<CR>', opts)
  bufmap("n", "<leader>td", ":Gitsigns toggle_deleted<CR>", opts)

  bufmap("o", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
  bufmap("x", "ih", ":<C-U>Gitsigns select_hunk<CR>", opts)
end

-- nvim lspconfig
M.lsp = function(bufmap)
  bufmap("n", "[e", ":lua vim.diagnostic.goto_prev()<CR>", opts)
  bufmap("n", "]e", ":lua vim.diagnostic.goto_next()<CR>", opts)
  bufmap("n", "<leader>e", ":lua vim.diagnostic.open_float()<CR>", opts)
  bufmap("n", "<leader>q", ":lua vim.diagnostic.setloclist()<CR>", opts)

  bufmap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
  bufmap("n", "gr", ":lua vim.lsp.buf.references()<CR>", opts)
  bufmap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "gD", ":lua vim.lsp.buf.declaration()<CR>", opts)
  bufmap("n", "gs", ":lua vim.lsp.buf.signature_help()<CR>", opts)
  bufmap("n", "gh", ":lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap("n", "<leader>rn", ":lua vim.lsp.buf.rename()<CR>", opts)
  bufmap("n", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
  bufmap("v", "<leader>ca", ":lua vim.lsp.buf.code_action()<CR>", opts)
end
return M
