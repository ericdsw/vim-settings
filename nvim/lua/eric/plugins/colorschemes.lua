return {
  -- {
  --   "catppuccin/nvim",
  --   name = "catppuccin",
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme "catppuccin-frappe"
  --   end
  -- }
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd.colorscheme "tokyonight-night"
  --   end
  -- }
  {
    "neanias/everforest-nvim",
    priority = 100,
    config = function()
      vim.cmd.colorscheme "everforest"
    end
  }
}
