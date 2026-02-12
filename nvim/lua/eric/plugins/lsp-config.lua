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

      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      -- Lua
      vim.lsp.config('lua_ls', {
        capabilities = capabilities
      })
      vim.lsp.enable('lua_ls')

      -- GDScript configuration
      vim.lsp.config('gdscript', {
        capabilities = capabilities,
        -- flags = {
        --   debounce_text_change = 150
        -- },
        -- cmd = { "netcat", "127.0.0.1", "6005" }
      })
      vim.lsp.enable('gdscript')

      -- Typescript configuration
      vim.lsp.config('ts_ls', {
        capabilities = capabilities
      })
      vim.lsp.enable('ts_ls')

      -- Global keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
