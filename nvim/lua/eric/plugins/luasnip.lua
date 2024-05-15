return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", 
    build = "make install_jsregexp",
    keys = function()
      return {}
    end,
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load({
        path = "~/.config/nvim/snippets"
      })
    end
  }
}
