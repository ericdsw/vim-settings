return {
  {
    'nvim-treesitter/nvim-treesitter', 
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "gdscript" },
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
