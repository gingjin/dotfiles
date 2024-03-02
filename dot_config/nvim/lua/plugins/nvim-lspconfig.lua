return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      {
        "williamboman/mason.nvim",
        opts = {
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
        dependencies = {
          {
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            opts = {
              ensure_installed = {
                "codelldb",
                "debugpy",
                "cmakelint",
                "cpplint",
                "flake8",
                "clang-format",
                "rustfmt",
                "stylua",
                "yapf",
              },
            },
          },
        },
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
          vim.diagnostic.config({
            virtual_text = { spacing = 2, prefix = "▎" },
            float = { border = "double" },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
          })

          local signs = require("G").signs
          for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
          end

          require("lspconfig.ui.windows").default_options.border = "rounded"
          require("mason-lspconfig").setup(opts)
        end,
      },
    },
  },
}
