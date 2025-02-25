return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
    },
    keys = function()
      return {}
    end,
    config = function()
      -- require("luasnip.loaders.from_snipmate").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load({
        paths = "~/.config/nvim/snippets"
      })
    end
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
    },

    config = function()

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              if luasnip.expandable() then
                luasnip.expand()
              else
                cmp.confirm({
                  select = true,
                })
              end
            else
              fallback()
            end
          end),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.locally_jumpable(1) then
              luasnip.jump(1)
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }), 
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        }, {
          { name = 'buffer' },
        })
      })

    --   cmp.setup({
    --     snippet = {
    --       expand = function(args)
    --         require('luasnip').lsp_expand(args.body)
    --       end
    --     },
    --     mapping = {
    --       ["<CR>"] = cmp.mapping.confirm({ select = false }),
    --       -- Ctrl+Space to trigger completion menu
    --       ["<C-Space>"] = cmp.mapping.complete(),
    --       -- ['<CR>'] = cmp.mapping(function(fallback)
    --       --   if cmp.visible() then
    --       --     if luasnip.expandable() then
    --       --         luasnip.expand()
    --       --     else
    --       --         cmp.confirm({
    --       --             select = true,
    --       --         })
    --       --     end
    --       --   else
    --       --     fallback()
    --       --   end
    --       -- end),
    --       ["<Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --           cmp.select_next_item()
    --         elseif luasnip.locally_jumpable(1) then
    --           luasnip.jump(1)
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --       ["<S-Tab>"] = cmp.mapping(function(fallback)
    --         if cmp.visible() then
    --           cmp.select_prev_item()
    --         elseif luasnip.locally_jumpable(-1) then
    --           luasnip.jump(-1)
    --         else
    --           fallback()
    --         end
    --       end, { "i", "s" }),
    --     },
    --     sources = cmp.config.sources({
    --       { name = 'luasnip' },
    --       { name = 'nvim_lsp' },
    --       { name = 'buffer' },
    --     })
    --   })
    end,
  }
}