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
                ensure_installed = { "lua_ls", "ts_ls", "pyright" }
            }

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
                root_markers = { { ".emmyrc.json", ".luarc.json", ".luarc.jsonc" }, { ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml" }, { ".git" } }
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
                filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' }
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

            -- Enable language servers
            -- vim.lsp.enable('lua_ls', 'gdscript', 'ts_ls', 'pyright')

            -- Global keymaps
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
