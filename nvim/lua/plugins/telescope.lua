return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<C-p>', builtin.find_files, { silent = true })

      local previewers = require("telescope.previewers")
      local Job = require("plenary.job")
      local new_maker = function(filepath, bufnr, opts)
        filepath = vim.fn.expand(filepath)
        Job:new({
          command = "file",
          args = { "--mime-type", "-b", filepath },
          on_exit = function(j)
            local mime_type = vim.split(j:result()[1], "/")[1]
            if mime_type == "text" then
              previewers.buffer_previewer_maker(filepath, bufnr, opts)
            else
              -- maybe we want to write something to the buffer here
              vim.schedule(function()
                vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
              end)
            end
          end
        }):sync()
      end

      local actions = require("telescope.actions")
      require("telescope").setup{
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close
            }
          },
          preview = {
            filesize_limit = 0.3
          },
          buffer_previewer_maker = new_maker,
          file_ignore_patterns = {
            "node_modules",
            "%.png",
            "%.jpg",
            "%.webp",
            "%.wav",
            "%.ogg",
            "%.ico"
          }
        }
      }
    end
  }
}
