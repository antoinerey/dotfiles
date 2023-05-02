require('nvim-tree').setup({
  git = {
    -- Do not display git-related information and icons.
    enable = false,
  },
  renderer = {
    -- Collapse empty directories into a single line.
    group_empty = true,
    icons = {
      show = {
        -- Folder icons are enough.
        folder_arrow = false,
      },
    },
    -- Show indentation markers.
    -- TODO: Change their colour to make them less visible.
    indent_markers = {
      enable = true,
    },
  },
  view = {
    -- Open the file tree on the right.
    side = 'right',
  },
  filters = {
    custom = {
      '^.git$',
      '^.DS_Store',
    },
  },
})

vim.keymap.set('n', '<Leader>e', ':NvimTreeFindFileToggle<CR>')
