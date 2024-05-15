return {
  {
    'nvim-treesitter/nvim-treesitter', 
    event = { "BufReadPre", "BufNewFile" },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "gdscript",
          "lua",
          "json",
          "javascript",
          "typescript",
          "tsx",
          "yaml",
          "html",
          "css",
          "markdown",
          "markdown_inline",
          "bash",
          "gitignore",
          "c"
        },
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
