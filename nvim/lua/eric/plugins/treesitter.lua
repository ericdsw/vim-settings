return {
  {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        auto_install = true,
        highlight = {
          additional_vim_regex_highlighting = true,
          enable = true,
        },
        indent = {
          disable = {
            "gdscript",
          },
        }
      })
    end
  }
}
