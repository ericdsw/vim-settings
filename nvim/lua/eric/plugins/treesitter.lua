return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").setup({
        auto_install = true,
        highlight = {
          additional_vim_regex_highlighting = true,
          enable = true,
        },
        indent = {
          enable = false
        }
      })
    end
  }
}
