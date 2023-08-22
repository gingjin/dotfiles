local servers = {
  "bashls",
  "clangd",
  "cmake",
  "lua_ls",
  "pyright",
  "rust_analyzer",
}

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("lspconfig.ui.windows").default_options.border = "double"

      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          require("extra.nvim-lspconfig.providers.lua_ls")
        else
          local M = require("extra.nvim-lspconfig.parameters")
          require("lspconfig")[server].setup({
            handlers = M.handlers,
            on_attach = M.on_attach,
            capabilities = M.capabilities,
          })
        end
      end
    end,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {
          github = {
            download_url_template = "https://ghproxy.com/https://github.com/%s/releases/download/%s/%s",
          },
          ui = {
            icons = {
              package_pending = "",
              package_installed = "",
              package_uninstalled = "ﮊ",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {
          ensure_installed = servers,
          automatic_installation = true,
        },
      },
    },
  },
}
