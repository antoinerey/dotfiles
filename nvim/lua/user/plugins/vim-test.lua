vim.keymap.set('n', '<Leader>tn', ':TestNearest<CR>')
vim.keymap.set('n', '<Leader>ta', ':TestSuite<CR>')

vim.g['test#javascript#runner'] = 'vitest'
vim.g['test#strategy'] = 'floaterm'
