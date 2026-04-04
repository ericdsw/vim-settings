return {
    {
        "nvim-tree/nvim-tree.lua",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local nvimtree = require("nvim-tree")

            nvimtree.setup {
                view = {
                    width = 35
                },
                filters = {
                    custom = { ".DS_Store" },
                    dotfiles = true
                },
                git = {
                    enable = false,
                },
                renderer = {
                    group_empty = true
                },
                filesystem_watchers = {
                    ignore_dirs = {
                        "node_modules",
                    },
                },
                log = {
                    enable = true,
                    truncate = true,
                    types = {
                        all = false,
                        config = false,
                        copy_paste = false,
                        dev = false,
                        diagnostics = true,
                        git = true,
                        profile = true,
                        watcher = true,
                    },
                },
            }

            vim.keymap.set("n", "<Leader>1", ":NvimTreeFindFileToggle<cr>", {})
            vim.keymap.set("n", "<Leader>er", ":NvimTreeRefresh<cr>", {})
            vim.keymap.set("n", "<Leader>ef", ":NvimTreeFindFile<cr>", {})
        end,
    }
}
