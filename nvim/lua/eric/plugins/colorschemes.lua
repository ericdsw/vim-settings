return {
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('tokyonight-moon')
  --   end
  -- } 
  {
    'rmehri01/onenord.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('onenord').setup()
    end
  }
  -- {
  --   'jnurmine/Zenburn',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('zenburn')
  --   end
  -- }
  -- {
  --   'AlexvZyl/nordic.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --       require('nordic').load()
  --   end
  -- }
  -- {
  --   "thesimonho/kanagawa-paper.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme("kanagawa-paper")
  --   end
  -- }
  -- {
  --   'talha-akram/noctis.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('noctis_minimus')
  --   end
  -- }
  -- {
  --   'sainnhe/gruvbox-material',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = true
  --     vim.cmd.colorscheme('gruvbox-material')
  --   end
  -- }
  -- {
  --   'sainnhe/everforest',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.g.everforest_enable_italic = true
  --     vim.o.background = "dark"
  --     vim.cmd.colorscheme('everforest')
  --   end
  -- },
}
