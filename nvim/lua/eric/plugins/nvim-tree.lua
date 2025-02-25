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

      nvimtree.setup {
        view = {
          width = 35
        },
        filters = {
          custom = { ".DS_Store" },
        },
        git = {
          ignore = false
        },
        renderer = {
          group_empty = true
        },
      }

      vim.keymap.set("n", "<Leader>1", ":NvimTreeFindFileToggle<cr>", {})
      vim.keymap.set("n", "<Leader>er", ":NvimTreeRefresh<cr>", {})
      vim.keymap.set("n", "<Leader>ef", ":NvimTreeFindfile<cr>", {})

    end,
  }
}
