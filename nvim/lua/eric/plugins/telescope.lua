return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end
      },
      "nvim-tree/nvim-web-devicons"
    },
    config = function()

      local telescope = require("telescope")
      local builtin = require('telescope.builtin')
      local actions = require("telescope.actions")
      local previewers = require("telescope.previewers")
      local Job = require("plenary.job")

      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<C-p>', builtin.find_files, { silent = true })

      telescope.setup {
        defaults = {
          path_display = { "smart" },
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist
            }
          },
          layout_config = {
            prompt_position = "top",
          },
          sorting_strategy = "ascending",
          file_ignore_patterns = {
            "node_modules",
            "%.png",
            "%.jpg",
            "%.webp",
            "%.wav",
            "%.ogg",
            "%.ico"
          }
        },
        pickers = {
          find_files = {
            find_command = { 'rg', '--files', '--hidden', '-g', '!.git'},
            layout_config = {
              height = 0.70
            }
          },
          buffers = {
            show_all_buffers = true
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
