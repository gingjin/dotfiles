-- 恢复上一次光标所在的行
vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif"]])

-- 当 nvim 打开一个目录时，自动打开 nvim-tree
local function open_nvim_tree(data)
  local directory = vim.fn.isdirectory(data.file) == 1
  if not directory then
    return
  end
  vim.cmd.cd(data.file)
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- 根据 nvim_treesitter 进行代码折叠
vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

-- 当vimtex退出事件触发时，vimtex自动完成清理
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "VimtexEventQuit" },
  group = vim.api.nvim_create_augroup("vimtex_config", {}),
  command = "call vimtex#compiler#clean(0)",
})
-- 当latex文件保存后，vimtex自动刷新目录
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  group = vim.api.nvim_create_augroup("VimTex", {}),
  pattern = { "*.tex" },
  command = "call vimtex#toc#refresh()",
})
