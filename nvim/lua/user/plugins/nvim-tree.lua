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

-- Switch focus between the tree and the current buffer.
-- See https://github.com/nvim-tree/nvim-tree.lua/discussions/1672
function toggle_focus()
	if vim.fn.bufname():match 'NvimTree_' then
		vim.cmd.wincmd 'p'
	else
		vim.cmd('NvimTreeFindFile')
	end
end

-- Open/close the tree, but do not focus it.
function toggle_tree()
  require('nvim-tree.api').tree.toggle({ focus = false })
end

vim.keymap.set('n', '<Leader>E', '<cmd>:lua toggle_tree()<CR>')
vim.keymap.set('n', '<Leader>e', '<cmd>:lua toggle_focus()<CR>')
