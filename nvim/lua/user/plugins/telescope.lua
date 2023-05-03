local actions = require('telescope.actions')

require('telescope').setup({
  defaults = {
    -- Launch telescope in normal mode by default.
    initial_mode = 'normal',
    -- Move the search box at the top (instead of bottom).
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy = 'ascending',
    mappings = {
      i = {
        -- ['<esc>'] = actions.close,
        ['<C-Down>'] = actions.cycle_history_next,
        ['<C-Up>'] = actions.cycle_history_prev,
      },

      n = {
        -- Allow deleting a buffer from Telescope.
        -- See https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes#mapping-c-d-to-delete-buffer.
        ['<C-d>'] = actions.delete_buffer + actions.move_to_top,
      }
    },
    -- Never search inside the .git directory.
    file_ignore_patterns = { '.git/' },
  },
  pickers = {
    find_files = {
      -- Show files starting with a dot (.eslintrc, .prettierrc, etc).
      hidden = true,
    },

    buffers = {
      -- Sort buffers by most recently used.
      sort_mru = true,
      -- Select the last used buffer by default.
      sort_lastused = true,
    },
  },
})

vim.keymap.set('n', '<leader>p', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>P', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All files' })<Cr>]])
vim.keymap.set('n', '<leader>o', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
