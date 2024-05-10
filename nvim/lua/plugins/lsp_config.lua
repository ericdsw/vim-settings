return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp'
    },
    config = function()
      require("lspconfig").gdscript.setup {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
        flags = {
          debounce_text_change = 150
        },
        cmd = { "netcat", "localhost", "6008" }
      } 
    end
  }
}