return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        keys = {
          { "<A-m>", "<Cmd>Mason<CR>", desc = "Mason", silent = true },
        },
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {
          github = {
            download_url_template = "https://download.fastgit.org/%s/releases/download/%s/%s",
          },
          ui = {
            border = "rounded",
            icons = {
              package_installed = "✓",
              package_pending = "➜",
              package_uninstalled = "✗",
            },
          },
        },
      },
      {
        "williamboman/mason-lspconfig.nvim",
        opts = function()
          return {
            ensure_installed = require("G").servers,
            automatic_installation = true,
            handlers = {
              function(server_name)
                local M = require("extra.nvim-lspconfig.parameters")
                require("lspconfig")[server_name].setup({
                  handlers = M.handlers,
                  on_attach = M.on_attach,
                  capabilities = M.capabilities,
                })
              end,
              ["lua_ls"] = function()
                local M = require("extra.nvim-lspconfig.parameters")
                require("lspconfig")["lua_ls"].setup({
                  handlers = M.handlers,
                  on_attach = M.on_attach,
                  capabilities = M.capabilities,
                  settings = {
                    Lua = {
                      diagnostics = {
                        globals = { "vim" },
                      },
                    },
                  },
                })
              end,
            },
          }
        end,
        config = function(_, opts)
          require("lspconfig.ui.windows").default_options.border = "rounded"
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
  },
}
