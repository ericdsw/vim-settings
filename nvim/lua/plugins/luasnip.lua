return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", 
    build = "make install_jsregexp",
    keys = function()
      return {}
    end,
    config = function()
      -- require("luasnip.loaders.from_snipmate").load()
      require("luasnip.loaders.from_snipmate").lazy_load({paths = "~/.config/nvim/snippets"})
    end
  }
}