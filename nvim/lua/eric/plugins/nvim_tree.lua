return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()

      local nvimtree = require("nvim-tree")

      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      nvimtree.setup {
        view = {
          width = 35
        },
        filters = {
          custom = { ".DS_Store" },
        },
        git = {
          ignore = false
        }
      }

      local keymap = vim.keymap

      keymap.set("n", "<Leader>1", ":NvimTreeFindFileToggle<cr>", {})
      keymap.set("n", "<Leader>er", ":NvimTreeRefresh<cr>", {})

    end,
  }
}