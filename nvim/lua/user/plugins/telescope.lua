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
      }
    },
    -- Never search inside the .git directory.
    file_ignore_patterns = { '.git/' }
  },
  pickers = {
    find_files = {
      -- Show files starting with a dot (.eslintrc, .prettierrc, etc).
      hidden = true
    }
  }
})

vim.keymap.set('n', '<leader>p', [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
vim.keymap.set('n', '<leader>P', [[<cmd>lua require('telescope.builtin').find_files({ no_ignore = true, prompt_title = 'All files' })<Cr>]])
vim.keymap.set('n', '<leader>o', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
