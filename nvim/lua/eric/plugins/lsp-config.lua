return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/nvim-cmp',
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim'
    },
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      )

      require('mason').setup()
      local mason_lspconfig = require 'mason-lspconfig'
      mason_lspconfig.setup {
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "rust_analyzer" }
      }

      -- Rust
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust_analyzer"] = {
            imports = {
              granularity = {
                group = "module",
              },
              prefix = "self",
            }
          },
          cargo = {
            buildScripts = {
              enable = true,
            },
          },
          procMacro = {
            enable = true
          },
        },
      })
      vim.lsp.enable("rust_analyzer")
      -- Enable different LSP features.
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
          -- Inlay hints display inferred types, etc.
          if client:supports_method("inlayHint/resolve") then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
          end
          -- Completion can be invoked via ctrl+x ctrl+o. It displays a luist of
          -- names inferred from the context (e.g. method names, variables, etc.)
          if client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, ev.buf, {})
          end
        end,
      })

      -- Lua
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
        filetypes = { 'lua' },
        settings = {
          Lua = {
            codeLens = { enable = true },
            hint = { enable = true, semicolon = 'Disable' },
          },
        },
        root_markers = {
          { ".emmyrc.json", ".luarc.json",  ".luarc.jsonc" },
          { ".luacheckrc",  ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" },
          { ".git" },
        }
      })
      vim.lsp.enable('lua_ls')

      -- GDScript configuration
      vim.lsp.config('gdscript', {
        capabilities = capabilities,
        flags = {
          debounce_text_change = 150
        },
        cmd = { "netcat", "127.0.0.1", "6005" },
        filetypes = { 'gd', 'gdscript', 'gdscript3' },
      })
      vim.lsp.enable('gdscript')

      -- Typescript configuration
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
        filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
      })
      vim.lsp.enable('ts_ls')

      -- Python setup
      vim.lsp.config('pyright', {
        capabilities = capabilities,
        filetypes = { 'python' },
        root_markers = { "pyrightconfig.json", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
        settings = {
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = "openFilesOnly",
              useLibraryCodeForTypes = true
            }
          }
        }
      })
      vim.lsp.enable('pyright')

      -- Global keymaps
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
    end
  }
}
