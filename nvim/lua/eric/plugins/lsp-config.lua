return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp'
    },
    config = function()

      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- Lua
      lspconfig.lua_ls.setup {
        capabilities = capabilities
      }

      -- GDScript configuration
      lspconfig.gdscript.setup {
        capabilities = capabilities,
        flags = {
          debounce_text_change = 150
        },
        cmd = { "netcat", "localhost", "6005" }
      }

      -- Typescript configuration
      lspconfig.ts_ls.setup {
        capabilities = capabilities
      }

      -- Global keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
